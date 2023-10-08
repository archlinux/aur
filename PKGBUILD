# Maintainer: user <matmoul at the google email domain which is .com>

_githubuser=gwenhael-le-moine
_githubrepo=x48ng
_pkgtagname=0.30.0

pkgname=x48ng
pkgver=0.30.0
pkgrel=1
pkgdesc='A reboot of the x48 HP 48 emulator'
arch=('any')
url="https://github.com/${_githubuser}/${_githubrepo}"
license=('GPL2')
depends=('readline' 'ncurses' 'sdl12-compat' 'sdl_gfx' 'libx11' 'libxext' 'xterm' 'xorg-mkfontscale' 'xorg-fonts-misc')
makedepends=('lua')
install="${pkgname}.install"
source=("${_githubrepo}::https://github.com/${_githubuser}/${_githubrepo}/archive/refs/tags/${_pkgtagname}.tar.gz"
        'runtime_options.c_1.patch'
        'ui_text.c_1.patch')
sha256sums=('4615d2231682e608450fd35c38a18689c380a8279cbca537fdb85e1f5978af8f'
            '995ede538e1a5aecabdfe2d7d0fa45277f8cfc5c16ed467d2a74a7375a5d1e3d'
            '94550704486e179bf0e1495b5fb6fc55c9663fe61d6e44dd45cff8bfe840f301')

build() {
	cd "${_githubrepo}-${pkgver}"
        patch --forward --strip=1 --input="${srcdir}/runtime_options.c_1.patch"
        patch --forward --strip=1 --input="${srcdir}/ui_text.c_1.patch"
	make GUI=x11
}

package() {
	cd "${_githubrepo}-${pkgver}"
	make DESTDIR="${pkgdir}/" install
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

