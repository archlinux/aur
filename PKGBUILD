# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Michael Straube <michael.straube@posteo.de>
# Contributor: Seth Schroeder <theking@kingdomofseth.com>
# Contributor: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=leocad
pkgver=19.07.1
pkgrel=1
pkgdesc="A CAD program for creating virtual LEGO models"
arch=('i686' 'x86_64')
url="http://leocad.org"
license=('GPL')
depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('qt5-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/leozide/leocad/archive/v$pkgver.tar.gz"
        "https://github.com/leozide/leocad/releases/download/v18.02/Library-Linux-11494.zip")
sha512sums=('7c7d896920ca0eb2bd9e19080e1532ab76454d6585bee4b09a198f4abff23a7a40b396bc0bdf433f1c7eca99e17c440cbad8f1e5f30b043906e418404438517b'
            '2389a1814f4cf94a6a1b449adc2782b8d6cb3c781ecbf75b964f002a35b7283e41c41b0684f4aa70e3d2dd880bd1032b94ecd33b862dbcd9cdf56b88024a5e28')

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
