# Maintainer: Denilson Sá <denilsonsa@gmail.com>

# Note: the source-code repository is tile-driller, but the compiled binary is tiledriller.

pkgname=tile-driller-git
pkgver=r10.a877795
pkgrel=1
pkgdesc="Yet another simple tile painting program for GTK 2"
arch=('i686' 'x86_64')
# Older homepage: https://www.villehelin.com/tiledriller.html
url="https://github.com/vhelin/tile-driller"
license=('GPL2')
depends=('gtk2' 'libpng' 'libjpeg' 'zlib')
makedepends=('git')
source=('git+https://github.com/vhelin/tile-driller.git#branch=master')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="${pkgdir}/" PREFIX=/usr install
}
