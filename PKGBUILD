# Maintainer: MatMoul <matmoul at the google email domain which is .com>

_githubuser=gwenhael-le-moine
_githubrepo=x48ng
_pkgtagname=0.41.1

pkgname=x48ng
pkgver=0.41.1
pkgrel=1
pkgdesc='A reboot of the x48 HP 48 emulator'
arch=('any')
url="https://github.com/${_githubuser}/${_githubrepo}"
license=('GPL2')
depends=('readline' 'ncurses' 'sdl12-compat' 'sdl_gfx' 'libx11' 'libxext' 'xterm' 'xorg-mkfontscale' 'xorg-fonts-misc')
makedepends=('lua')
install="${pkgname}.install"
source=("${_githubrepo}-${pkgver}.tar.gz::https://github.com/${_githubuser}/${_githubrepo}/archive/refs/tags/${_pkgtagname}.tar.gz"
        'ui_text.c_1.patch')
sha256sums=('af921838f62ae2c01217ed9a3e6504069e33b2a642d0700bbc29422a4cfbf56f'
            '94550704486e179bf0e1495b5fb6fc55c9663fe61d6e44dd45cff8bfe840f301')

build() {
	cd "${_githubrepo}-${pkgver}"
	make clean-all && make GUI=x11
}

package() {
	cd "${_githubrepo}-${pkgver}"
        make DESTDIR="${pkgdir}/" install
        install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/x48ng/LICENSE"
}

