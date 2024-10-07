# Maintainer: MatMoul <matmoul at the google email domain which is .com>

_githubuser=gwenhael-le-moine
_githubrepo=x48ng
_gitcommit=429162e8a38e350565b2e6a9c0e6af28944c1b89

pkgname=x48ng-git
pkgver=0.41.0.r2.429162e
pkgrel=1
pkgdesc='A reboot of the x48 HP 48 emulator'
arch=('any')
url="https://github.com/${_githubuser}/${_githubrepo}"
license=('GPL2')
depends=('readline' 'ncurses' 'sdl12-compat' 'sdl_gfx' 'libx11' 'libxext' 'xterm' 'xorg-mkfontscale' 'xorg-fonts-misc')
makedepends=('git' 'lua')
install="${pkgname}.install"
provides=('x48ng')
conflicts=('x48ng')
source=("git+https://github.com/${_githubuser}/${_githubrepo}.git#commit=${_gitcommit}")
sha256sums=('SKIP')

build() {
	cd "${_githubrepo}"
	make clean-all && make GUI=x11
}

package() {
	cd "${_githubrepo}"
	make DESTDIR="${pkgdir}/" install
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/x48ng/LICENSE"
}
