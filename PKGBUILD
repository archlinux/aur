# Maintainer: MatMoul <matmoul at the google email domain which is .com>

_githubuser=gwenhael-le-moine
_githubrepo=x48ng
_gitcommit=08d6ae9eb66cc65358c8316ef8d9cdd62aeda82a

pkgname=x48ng-git
pkgver=0.35.0.r2.08d6ae9
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
source=("git+https://github.com/${_githubuser}/${_githubrepo}.git#commit=${_gitcommit}" 'ui_text.c_1.patch')
sha256sums=('SKIP'
            '94550704486e179bf0e1495b5fb6fc55c9663fe61d6e44dd45cff8bfe840f301')

build() {
	cd "${_githubrepo}"
	patch --forward --strip=1 --input="${srcdir}/ui_text.c_1.patch"
	make clean-all && make GUI=x11
}

package() {
	cd "${_githubrepo}"
	make DESTDIR="${pkgdir}/" install
        install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/x48ng/LICENSE"
}
