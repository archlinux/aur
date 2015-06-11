# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
pkgname=xz-java
pkgver=1.5
pkgrel=1
pkgdesc="Java library for XZ and LZMA compression"
arch=('any')
url="http://tukaani.org/xz/java.html"
license=('Public Domain')
depends=('java-runtime>=1.4')
makedepends=('java-environment>=1.4', 'unzip')
provides=('xz-java')
conflicts=('xz-java')
source=(http://tukaani.org/xz/xz-java-$pkgver.zip)
sha256sums=(0146e437b01ac77046d256a2e7537768b6922c49635c27fa40b3cf745bb2db74)

build() {
  cd "$srcdir"
  javac -source 1.4 -target 1.4 -d . -s src -cp . $(find src | grep \\.java\$)
  jar -cf xz-java.jar $(find . | grep \\.class\$)
}

package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/lib/"
  install -m 755 xz-java.jar "$pkgdir/usr/lib/"
}
