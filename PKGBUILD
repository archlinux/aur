# Maintainer: MGislv <nocentinigabriele91@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=terminalpp-git
pkgver=v0.8.4.r2.gca8811d
pkgrel=2
pkgdesc="Minimalist, fast, cross-platform terminal emulator"
arch=('x86_64')
url="https://terminalpp.com"
license=('MIT')
conflicts=('terminalpp' 'terminalpp-bin')
depends=('libxft' 'libxcursor' 'libxext' 'gcc-libs')
makedepends=('cmake' 'gcc10' 'git' 'imagemagick' 'cloc' 'doxygen' 'graphviz')
source=(git+https://github.com/terminalpp/terminalpp)
sha512sums=('SKIP')

pkgver() {
	cd terminalpp
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	mkdir -p terminalpp/build
}

build() {
	cd terminalpp/build
	cmake -DCMAKE_BUILD_TYPE=None \
	      -DCMAKE_INSTALL_PREFIX=/usr \
	      -DCMAKE_C_COMPILER=gcc-10 \
	      -DCMAKE_CXX_COMPILER=g++-10 \
	      -DINSTALL=terminalpp \
	      ..
	make
}

package() {
	cd terminalpp/build
	DESTDIR="$pkgdir" make install

	install -Dm644 ../LICENSE.md "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
