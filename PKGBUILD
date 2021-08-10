# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Sam Whited <sam@samwhited.com>
# Contributor: geno+dev@fireorbit.de

pkgname=purism-chatty
pkgver=0.3.4
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
sha256sums=('a957d3955ca83727bb4ba3d8bc0fbe5bdd87bf2286ff099c5dc8f62aab1e102d')

build() {
	rm -rf build
	arch-meson "chatty-v${pkgver}" build -Dexamples=false -Dgtk_doc=true
	ninja -C build
}

package() {
	DESTDIR="${pkgdir}" ninja -C build install
}
