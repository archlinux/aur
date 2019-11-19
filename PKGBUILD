# Maintainer: Sam Whited <sam@samwhited.com>
# Contributor: geno+dev@fireorbit.de

pkgname=purism-chatty
pkgver=0.1.2
pkgrel=1
pkgdesc="XMPP and SMS messaging via libpurple and Modemmanager"
url="https://source.puri.sm/Librem5/chatty"
license=(LGPL2.1)
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
sha256sums=('848508c4165b71bc3078a25a87e495e4817ddcaf98abf159f4615c18fc7f8ff9')

build() {
	rm -rf build
	arch-meson "chatty-v${pkgver}" build -Dexamples=false -Dgtk_doc=true
	ninja -C build
}

package() {
	DESTDIR="${pkgdir}" ninja -C build install
}
