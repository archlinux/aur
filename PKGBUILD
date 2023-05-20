# Maintainer: genofire <geno+dev@fireorbit.de>
# Maintainer: Julian <juliannfairfax@protonmail.com>
# Contributor: la Fleur <lafleur at boum dot org>

_pkgname="purism-chatty"
pkgname="${_pkgname}-git"
pkgver=0.7.3
pkgrel=1
pkgdesc="XMPP and SMS messaging via libpurple and Modemmanager"
url="https://source.puri.sm/Librem5/chatty"
license=("GPL3")
arch=("i686" "x86_64" "armv6h" "armv7h" "aarch64")
depends=("evolution-data-server"
	"feedbackd"
	"libolm" 
	"libpurple")
optdepends=("libpurple-carbons: XMPP XEP-0280 Message Carbons plugin"
	"libpurple-lurch: XEP-0384 OMEMO Encryption plugin"
	"purple-xmpp-http-upload: HTTP File Upload plugin")
makedepends=("itstool"
	"meson"
	"pkg-config")
provides=("purism-chatty")
conflicts=("purism-chatty")
source=("git+https://source.puri.sm/Librem5/chatty.git")
sha256sums=("SKIP")

build() {
	cd chatty
	git submodule update --init
	arch-meson build
	ninja -C build
}

package() {
    cd chatty
	DESTDIR="${pkgdir}" ninja -C build install
}
