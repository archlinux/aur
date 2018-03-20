# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
pkgname="seahorse-caja"
pkgver="1.18.4"
pkgrel="1"
pkgdesc="An extension for caja which allows encryption and decryption of OpenPGP files using GnuPG."
url="https://github.com/darkshram/seahorse-caja/"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('caja' 'libcryptui')
provides=("${pkgname}")
source=("https://github.com/darkshram/"${pkgname}/releases/download/${pkgver}/"${pkgname}-${pkgver}.tar.xz")
sha256sums=('c604705d8e700d14dca7f1ab983c82541e291fde27177146b95339b5f7602dca')

build() {
    cd "${pkgname}-${pkgver}"
    NOCONFIGURE=1 ./autogen.sh
    ./configure --prefix /usr
    make
}
package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR=${pkgdir} install
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=4 sw=2 ft=sh et:
