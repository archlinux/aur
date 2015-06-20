# Maintainer: Sandor Nagy < sanya868 at gmail dot com >
# Contributor: Igor R. Dejanovic igor.dejanovic@gmail.com

pkgname=protobuf-java
_xpkgname=protobuf
pkgver=2.6.1
pkgrel=1
pkgdesc="Google's data interchange format utility (java API)."
url="http://code.google.com/p/protobuf/"
license=('custom:BSD')
arch=('any')
depends=("java-environment")
makedepends=('java-environment' 'maven' "${_xpkgname}>=${pkgver}")
source=(https://github.com/google/protobuf/releases/download/v$pkgver/$_xpkgname-$pkgver.tar.gz protobuf-java.patch)
md5sums=('f3916ce13b7fcb3072a1fa8cf02b2423'
         '01a3244c88fc5ddfee07c658c0bc7df4')

build() {
  cd $srcdir/$_xpkgname-$pkgver
  patch -p1 < ../protobuf-java.patch

  cd $srcdir/$_xpkgname-$pkgver/java
  mvn package
}

package() {
  install -Dm644 "$srcdir/$_xpkgname-$pkgver/java/target/$pkgname-$pkgver.jar" \
                "$pkgdir/usr/share/java/$pkgname/$pkgname-$pkgver.jar"
  install -Dm644 "$srcdir/$_xpkgname-$pkgver/LICENSE" \
      "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
