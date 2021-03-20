# Maintainer: Antonín Dach <dach@protonmail.com>
# Contributor: Vincent Grande <shoober420@gmail.com>

pkgname=wayst-git
pkgver=r222.4143e35
pkgrel=1
pkgdesc='Simple terminal emulator for Wayland and X11 with OpenGL rendering and minimal dependencies.'
arch=('x86_64')
url='https://github.com/91861/wayst'
license=('MIT')
depends=('mesa' 'freetype2' 'fontconfig' 'libxkbcommon' 'libxrandr' 'libutf8proc')
makedepends=('git') 
provides=('wayst')
conflicts=('wayst')
install=
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
	make
}

package() {
	cd "$srcdir/wayst"
	mkdir -p "$pkgdir/usr/bin"
	make INSTALL_DIR="$pkgdir/usr/bin" install
}
