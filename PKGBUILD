# Maintainer: Sam Whited <sam@samwhited.com>
# Contributor: geno+dev@fireorbit.de

pkgname=purism-chatty
pkgver=0.1.5
pkgrel=1
pkgdesc="XMPP and SMS messaging via libpurple and Modemmanager"
url="https://source.puri.sm/Librem5/chatty"
license=(GPL3)
arch=(i686 x86_64 armv6h armv7h)
depends=(
  'folks'
  'libhandy'
  'libpurple'
)
optdepends=('libpurple-lurch: XMPP E2E OMEMO encryption'
            'libpurple-carbons: XMPP Carbon Copy - Live multiple device support'
            'purple-xmpp-http-upload: XMPP HTTP Upload - Filesharing')
makedepends=(
  'meson'
  'pkg-config'
)
provides=(purism-chatty)
conflicts=(purism-chatty)
source=("https://source.puri.sm/Librem5/chatty/-/archive/v${pkgver}/chatty-v${pkgver}.tar.bz2")
sha256sums=('4ed523199340bc98f8a99c4d8ba58e502fa762a89d7854b0351b543880579e0e')

build() {
	rm -rf build
	arch-meson "chatty-v${pkgver}" build -Dexamples=false -Dgtk_doc=true
	ninja -C build
}

package() {
	DESTDIR="${pkgdir}" ninja -C build install
}
