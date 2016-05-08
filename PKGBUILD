# Maintainer: nblock <nblock [/at\] archlinux DOT us>

pkgname=qrk
_pkgname=QRK
pkgver=0.16.0507
pkgrel=1
pkgdesc="A graphical cash register for small companies"
arch=('i686' 'x86_64')
url="http://www.ckvsoft.at/"
license=('GPL3')
makedepends=('qt5-declarative')
depends=('qrencode'
         'crypto++')
source=("http://downloads.sourceforge.net/project/qrk-registrier-kasse/source/${_pkgname}_${pkgver}.source.tar.gz"
        "${pkgname}.desktop")

md5sums=('d6431e4df9367227694790996ea181bb'
         '52c990903894fdecd440e2e2914c2f09')
sha256sums=('5e37c91b115dc246a1a60438ceebee2f67b8720dc1a2d2a097bd2a669fb3ea96'
            'f71882aea62bd7c07e4806f0223d1699170ac89d59036f5fd5add1004eb93cd0')

build() {
  cd "${srcdir}/${_pkgname}_${pkgver}_source"

  qmake-qt5 "${_pkgname}.pro"
  make
}

package() {
  cd "${srcdir}/${_pkgname}_${pkgver}_source"

  mkdir -p ${pkgdir}/usr/{bin,share/applications}
  install -D -m755 "bin/$pkgname" "$pkgdir"/usr/bin/$pkgname
  install -D -m644 "src/icons/logo.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -D -m644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# vim: set ts=2 sw=2 ft=sh noet:
