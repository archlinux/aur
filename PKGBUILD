# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Vincent Grande <shoober420@gmail.com>
# Contributor: Antonín Dach <dach@protonmail.com>

pkgname=wayst-x11-git
pkgver=r291.df032d7
pkgrel=1
pkgdesc='Simple terminal emulator for Wayland and X11 with OpenGL rendering and minimal dependencies.'
arch=('x86_64')
url='https://github.com/91861/wayst'
license=('MIT')
depends=('mesa' 'freetype2' 'fontconfig' 'libxkbcommon' 'libxrandr' 'libutf8proc')
makedepends=('git') 
provides=('wayst')
conflicts=('wayst')
source=('git+https://github.com/91861/wayst.git#branch=master')
md5sums=('SKIP')

pkgver() {
	cd wayst
	( set -o pipefail
	  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd wayst
	make window_protocol=x11
}

package() {
	cd wayst
	mkdir -p "$pkgdir/usr/bin"
	make INSTALL_DIR="$pkgdir/usr/bin" install
}
