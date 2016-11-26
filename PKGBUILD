# Maintainer: Sandor Nagy < sanya868 at gmail dot com >
# Contributor: Igor R. Dejanovic igor.dejanovic@gmail.com

pkgname=protobuf-java
_xpkgname=protobuf
pkgver=3.0.2
pkgrel=1
pkgdesc="Google's data interchange format utility (Java API)."
url="https://github.com/google/protobuf"
license=('custom:BSD')
arch=('any')
depends=("java-environment")
makedepends=('java-environment' 'maven' "${_xpkgname}>=${pkgver}")
source=(https://github.com/google/protobuf/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz protobuf-java.patch)
md5sums=('ad399c77930e1858090af6370306e238'
         '43b422420bec658f0471fb3f4f9558c5')

build() {
  cd $srcdir/$_xpkgname-$pkgver
  patch -p1 < ../protobuf-java.patch

  cd $srcdir/$_xpkgname-$pkgver/java
  mvn package
}

package() {
  install -Dm644 "$srcdir/$_xpkgname-$pkgver/java/core/target/$pkgname-$pkgver.jar" \
                "$pkgdir/usr/share/java/$pkgname/$pkgname-$pkgver.jar"
  install -Dm644 "$srcdir/$_xpkgname-$pkgver/LICENSE" \
      "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
