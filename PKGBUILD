# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Sam Whited <sam@samwhited.com>
# Contributor: geno <dev@fireorbit.de>
# Contributor: <luntik2012@gmail.com>

pkgname=purism-chatty
pkgver=0.4.0
pkgrel=1
pkgdesc="XMPP and SMS messaging via libpurple and Modemmanager"
url="https://source.puri.sm/Librem5/chatty"
license=(GPL3)
arch=(i686 x86_64 armv6h armv7h aarch64)
depends=(evolution-data-server
         feedbackd
         libhandy
         libolm
         libpurple-carbons)
optdepends=('libpurple-lurch: XMPP E2E OMEMO encryption'
            'purple-xmpp-http-upload: XMPP HTTP Upload - Filesharing')
makedepends=(meson
             pkg-config)
provides=(purism-chatty)
conflicts=(purism-chatty)
source=("https://source.puri.sm/Librem5/chatty/-/archive/v${pkgver}/chatty-v${pkgver}.tar.bz2")
sha512sums=('28d4aa071555a658418087721bf53cc45b91fec6fb2aef41d29fa29f97116e38ab6c06d9d42a37ac9b36be8c1d7984f8cbc823bfb71985a39cf43631ddcce496')

build() {
	rm -rf build
	arch-meson "chatty-v${pkgver}" build
	ninja -C build
}

package() {
	DESTDIR="${pkgdir}" ninja -C build install
}
