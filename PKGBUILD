# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Michael Straube <michael.straube@posteo.de>
# Contributor: Seth Schroeder <theking@kingdomofseth.com>
# Contributor: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=leocad
pkgver=18.02
pkgrel=2
pkgdesc="A CAD program for creating virtual LEGO models"
arch=('i686' 'x86_64')
url="http://leocad.org"
license=('GPL')
depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('qt5-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/leozide/leocad/archive/v$pkgver.tar.gz"
        "$pkgname-$pkgver-library.zip::https://github.com/leozide/leocad/releases/download/v$pkgver/Library-Linux-11331.zip")
sha512sums=('cf7b878d2a39775d6f0a4d07608a99144d832a06e9813b79dd85e018f7fb16cddb8a1f5cc4640488a0168aeb8549e7ee91811e4a4b9f727d788b598f10f25d97'
            '6e303c6b3aa2b1948a69d6165555ab069d211b71ec26e7b8903c7dbd0d716483765d45265fedca67fbd1df21bc2af92f224638668db15bd849cd60f9fb0598d6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # create Makefile with QMake
  qmake-qt5 \
    INSTALL_PREFIX=/usr \
    DISABLE_UPDATE_CHECK=1 \
    "${pkgname}.pro"

  # build package
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # copy install to pkgdir
  make INSTALL_ROOT="${pkgdir}" install

  # install parts library
  install -Dm644 "${srcdir}/library.bin" "${pkgdir}/usr/share/leocad/library.bin"
}
