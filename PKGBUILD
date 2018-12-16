# Maintainer: Sandor Nagy < sandor dot nagy at kdemail dot net >
# Contributor: Igor R. Dejanovic igor.dejanovic@gmail.com

pkgname=protobuf-java
_xpkgname=protobuf
pkgver=3.6.1
pkgrel=1
pkgdesc="Google's data interchange format utility (Java API)."
url="https://github.com/google/protobuf"
license=('custom:BSD')
arch=('any')
depends=("java-environment")
makedepends=('java-environment' 'maven' "${_xpkgname}>=${pkgver}")
source=(https://github.com/google/protobuf/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz protobuf-java.patch)
md5sums=('6237b92a97a1e117e76de500879dfbb0'
         'e11f35927e78878e8b9354362591402f')

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
