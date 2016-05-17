# Maintainer: nblock <nblock [/at\] archlinux DOT us>

pkgname=qrk
_pkgname=QRK
pkgver=0.16.0517
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

md5sums=('e1aa9333602bec698fe288b05aece395'
         '52c990903894fdecd440e2e2914c2f09')
sha256sums=('a0db15f9e0c65667df4447d5fe6fd64dea5faff98ae111a8cc4992f57b2323bc'
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
