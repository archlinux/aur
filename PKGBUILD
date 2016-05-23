# Maintainer: nblock <nblock [/at\] archlinux DOT us>

pkgname=qrk
_pkgname=QRK
pkgver=0.16.0523
pkgrel=1
pkgdesc="A graphical cash register for small companies"
arch=('i686' 'x86_64')
url="http://www.ckvsoft.at/"
license=('GPL3')
makedepends=('qt5-declarative')
depends=('qrencode'
         'crypto++'
         'pcsclite')
source=("http://downloads.sourceforge.net/project/qrk-registrier-kasse/source/${_pkgname}_${pkgver}.source.tar.gz"
        "${pkgname}.desktop")

md5sums=('81783e5ed2bd7eac2feb083b924201ec'
         '52c990903894fdecd440e2e2914c2f09')
sha256sums=('60382dd5351690aa3af29d4a5d30b146d40fcc25c86bf3014703a48c9e968b6b'
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
