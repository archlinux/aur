# Maintainer: Sam Whited <sam@samwhited.com>
# Contributor: geno+dev@fireorbit.de

pkgname=purism-chatty
pkgver=0.1.3
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
sha256sums=('326673ba1e8fb92ca97d20d2105478f0e14d6f9252a705f3a8f323ecc0e5e2f7')

build() {
	rm -rf build
	arch-meson "chatty-v${pkgver}" build -Dexamples=false -Dgtk_doc=true
	ninja -C build
}

package() {
	DESTDIR="${pkgdir}" ninja -C build install
}
