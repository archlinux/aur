# Maintainer: user <matmoul at the google email domain which is .com>

_githubuser=gwenhael-le-moine
_githubrepo=x48ng
_pkgtagname=0.33.0

pkgname=x48ng
pkgver=0.33.0
pkgrel=1
pkgdesc='A reboot of the x48 HP 48 emulator'
arch=('any')
url="https://github.com/${_githubuser}/${_githubrepo}"
license=('GPL2')
depends=('readline' 'ncurses' 'sdl12-compat' 'sdl_gfx' 'libx11' 'libxext' 'xterm' 'xorg-mkfontscale' 'xorg-fonts-misc')
makedepends=('lua')
install="${pkgname}.install"
source=("${_githubrepo}::https://github.com/${_githubuser}/${_githubrepo}/archive/refs/tags/${_pkgtagname}.tar.gz"
        'ui_text.c_1.patch')
sha256sums=('8ff5f120f3e35286c6b2687f6ce6fc750e49f360d94fc3addbffc301c7563d2b'
            '94550704486e179bf0e1495b5fb6fc55c9663fe61d6e44dd45cff8bfe840f301')

build() {
	cd "${_githubrepo}-${pkgver}"
        patch --forward --strip=1 --input="${srcdir}/ui_text.c_1.patch"
	make GUI=x11
}

package() {
	cd "${_githubrepo}-${pkgver}"
	make DESTDIR="${pkgdir}/" install
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

