# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Dominik George <nik@naturalnet.de>
# Contributor: quantax -- contact via Arch Linux forum or AUR

pkgname=irssi-otr
pkgver=1.0.1
pkgrel=1
pkgdesc="Off-the-Record Messaging (OTR) for the Irssi IRC client"
url="https://github.com/cryptodotis/irssi-otr"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('irssi' 'libotr' 'glib2')
source=(${pkgname}-${pkgver}.tar.bz2::https://www.otr.im/dist/irssi-otr/irssi-otr-${pkgver}.tar.bz2)
sha512sums=('f7a2b04a1bd43b2436abe3592d8110acbe719575e295e789fd7ad92c87d4dbd99155439a6b1da349a3f86418a451fba2bfb1b085915e85688b5e214c1e9de0e2')

prepare() {
  cd ${pkgname}-${pkgver}
  autoreconf -fiv
}

build() {
  cd ${pkgname}-${pkgver}
  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim: ts=2 sw=2 et:
