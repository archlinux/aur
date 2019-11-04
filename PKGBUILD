# Maintainer: Sam Whited <sam@samwhited.com>
# Contributor: geno+dev@fireorbit.de

pkgname=purism-chatty
pkgver=0.1.1
pkgrel=1
pkgdesc="XMPP and SMS messaging via libpurple and Modemmanager"
url="https://source.puri.sm/Librem5/chatty"
license=(LGPL2.1)
arch=(i686 x86_64 armv6h armv7h)
depends=(gtk3 libpurple)
optdepends=('libpurple-lurch: XMPP E2E OMEMO encryption'
            'libpurple-carbons: XMPP Carbon Copy - Live multiple device support'
            'purple-xmpp-http-upload: XMPP HTTP Upload - Filesharing')
makedepends=(pkg-config meson libhandy folks)
provides=(purism-chatty)
conflicts=(purism-chatty)
source=("https://source.puri.sm/Librem5/chatty/-/archive/v${pkgver}/chatty-v${pkgver}.tar.bz2")
sha256sums=('f147ed2a0701ab728ae83913f33afcb685e3c48d9a5b2ecebf86a5e63856f93b')

build() {
	rm -rf build
	arch-meson "chatty-v${pkgver}" build -Dexamples=false -Dgtk_doc=true
	ninja -C build
}

package() {
	DESTDIR="${pkgdir}" ninja -C build install
}
