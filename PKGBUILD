# Maintainer: Sandor Nagy < sandor dot nagy at kdemail dot net >
# Contributor: Igor R. Dejanovic igor.dejanovic@gmail.com

pkgname=protobuf-java
_xpkgname=protobuf
_pkgver=21.12
pkgver=3.$_pkgver
pkgrel=1
pkgdesc="Google's data interchange format utility (Java API)."
url="https://github.com/google/protobuf"
license=('custom:BSD')
arch=('any')
depends=("java-environment")
makedepends=('java-environment' 'maven' "${_xpkgname}>=${_pkgver}")
source=(https://github.com/protocolbuffers/protobuf/releases/download/v$_pkgver/$pkgname-$pkgver.zip protobuf-java.patch)
md5sums=('64e600373a13ac0830a7febe8909b1ad'
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
