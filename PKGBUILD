# Maintainer: nblock <nblock [/at\] archlinux DOT us>

pkgname=qrk
_pkgname=QRK
pkgver=0.16.0502
pkgrel=2
pkgdesc="A cash register for small companies (mainly for Austrian companies)"
arch=('i686' 'x86_64')
url="http://www.ckvsoft.at/"
license=('GPL3')
makedepends=('qt5-declarative')
depends=('qrencode'
         'crypto++')
source=("http://downloads.sourceforge.net/project/qrk-registrier-kasse/source/${_pkgname}_${pkgver}.source.tar.gz"
        "${pkgname}.desktop"
        "0001-Use-QStandardPaths-AppDataLocation-as-base-path.patch"
        "0002-Remove-autoupdater.patch")

md5sums=('a784fe919008cd3dd2da61e3210c82ed'
         '52c990903894fdecd440e2e2914c2f09'
         '509dcbe51869181b8dfd9f3b5a754930'
         '94e130452ec5bbec65e04abe60a77c64')
sha256sums=('b7874437ed3ce655c0b548b484e28026acf5cb3ab5701553f3a598f99a37d459'
            'f71882aea62bd7c07e4806f0223d1699170ac89d59036f5fd5add1004eb93cd0'
            'f75d427a6d1969599a26a37e53b3c51a6fa43debf2eac135cc5e4dd71284aae3'
            '9297a91e210349d92559efc8f74189542bb63773824252e6aee53be2eb3101f9')

prepare() {
  cd "${srcdir}/${_pkgname}_${pkgver}_source"

  patch -Np1 < "${srcdir}/0001-Use-QStandardPaths-AppDataLocation-as-base-path.patch"
  patch -Np1 < "${srcdir}/0002-Remove-autoupdater.patch"
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
