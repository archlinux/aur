# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Sam Whited <sam@samwhited.com>
# Contributor: geno <dev@fireorbit.de>
# Contributor: <luntik2012@gmail.com>
# Contributor: Julian Fairfax <juliannfairfax@protonmail.com> 

_pkg="chatty"
pkgname="purism-${_pkg}"
pkgver=0.7.3
pkgrel=1
pkgdesc="XMPP and SMS messaging via libpurple and Modemmanager"
url="https://source.puri.sm/Librem5/${_pkg}"
license=(GPL3)
arch=(x86_64 i686 armv6h armv7h aarch64)
depends=(evolution-data-server
         feedbackd
         libhandy
         libolm
         libpurple-carbons)
optdepends=('libpurple-lurch: XMPP E2E OMEMO encryption'
            'purple-xmpp-http-upload: XMPP HTTP Upload - Filesharing')
makedepends=(meson
             pkg-config)
_commit="5e9dacb8080d99b15cc9e97455bf7ab41d42edd3"
source=("git+https://source.puri.sm/Librem5/${_pkg}#commit=${_commit}")
sha512sums=('SKIP')

build() {
	git -C "${_pkg}" submodule update --init
	arch-meson "${_pkg}" build
	ninja -C build
}

package() {
	DESTDIR="${pkgdir}" ninja -C build install
}
