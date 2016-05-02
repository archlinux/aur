# Maintainer: nblock <nblock [/at\] archlinux DOT us>

pkgname=qrk
_pkgname=QRK
pkgver=0.16.0502
pkgrel=1
pkgdesc="A cash register for small companies (mainly for Austrian companies)"
arch=('i686' 'x86_64')
url="http://www.ckvsoft.at/"
license=('GPL3')
makedepends=('qt5-declarative')
depends=('qrencode'
         'crypto++')
source=("http://downloads.sourceforge.net/project/qrk-registrier-kasse/source/${_pkgname}_${pkgver}.source.tar.gz"
        "${pkgname}.desktop"
        "0001-Use-QStandardPaths-AppDataLocation-as-base-path.patch")

md5sums=('a784fe919008cd3dd2da61e3210c82ed'
         '52c990903894fdecd440e2e2914c2f09'
         '0b8144d154ae8e14ae8ffb99e2292867')
sha256sums=('b7874437ed3ce655c0b548b484e28026acf5cb3ab5701553f3a598f99a37d459'
            'f71882aea62bd7c07e4806f0223d1699170ac89d59036f5fd5add1004eb93cd0'
            'fa91ac9a0e11af077b5806d5c134b0117ca091cbddce5e972b36d5a604b0ad68')

prepare() {
  cd "${srcdir}/${_pkgname}_${pkgver}_source"

  patch -Np1 < "${srcdir}/0001-Use-QStandardPaths-AppDataLocation-as-base-path.patch"
}

build() {
  cd "${srcdir}/${_pkgname}_${pkgver}_source"

  qmake-qt5 "${_pkgname}.pro"
  make
}

package() {
  cd "${srcdir}/${_pkgname}_${pkgver}_source"

  mkdir -p ${pkgdir}/usr/{bin,share/applications}
  install -D -m755 "bin/$_pkgname" "$pkgdir"/usr/bin/$pkgname
  install -D -m644 "src/icons/logo.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -D -m644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# vim: set ts=2 sw=2 ft=sh noet:
