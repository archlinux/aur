# Maintainer: Deshdeepak <rkdeshdeepak1@gmail.com>
pkgname=st-deshdeepak-git
_pkgname=st
pkgver=0.8.4.r1143.aa24ff7
pkgrel=1
pkgdesc="My build of simple (suckless) terminal with breeze colorscheme and patches."
arch=('x86_64')
url='https://github.com/deshdeepak1/st'
license=('MIT')
depends=('nerd-fonts-mononoki' 'libxft-bgra')
makedepends=('ncurses' 'libxext' 'git')
optdepends=(
    'gnu-free-fonts: Unicode support'
    'noto-fonts-emoji: Color Emoji Support'
    'noto-color-emoji-fontconfig: Prefer color emoji(Better rendering)'
    )
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "%s.r%s.%s" "$(awk '/^VERSION =/ {print $3}' config.mk)" \
		"$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_pkgname}"
	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
	cd "${_pkgname}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}

