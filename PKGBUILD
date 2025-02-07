# Maintainer: Raymond Li <aur@raymond.li>
# Co-maintainer: Steve Finkel <mrsteve0924@verizon.net>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Kevin Sullivan <ksullivan@archlinux.us>
# Contributor Krystian Duzynski <https://github.com/KrystianD>

pkgname=easystroke
pkgver=0.6.0
pkgrel=24
pkgdesc='Use mouse gestures to initiate commands and hotkeys'
arch=('x86_64')
url='https://github.com/mrsteve0924/easystroke'
license=('custom:ISC')
depends=('gtkmm3' 'boost-libs' 'libxtst' 'dbus-glib' 'xorg-server')
makedepends=('boost' 'xorgproto' 'intltool' 'gettext' 'xorg-server-devel' 'help2man')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mrsteve0924/${pkgname}/archive/v${pkgver}.tar.gz")

sha256sums=('4d632610242a07ab37338ec7cabd0f7d4fc318db1a322fa0a66ae13a359cf509')

prepare() {
  cd "${pkgname}-${pkgver}"
  #sed -E 's&-Wall&-Wno-error=incompatible-pointer-types&g' -i Makefile

}

build() {
  cd "${pkgname}-${pkgver}"

  make
  make man
}

package() {
  cd "${pkgname}-${pkgver}"

  make PREFIX=/usr DESTDIR="${pkgdir}" install

  install -Dm0644 "${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
