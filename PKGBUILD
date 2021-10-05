# Maintainer: MGislv <nocentinigabriele91@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=terminalpp-git
pkgver=0.8.4.r2.gca8811d
pkgrel=2
pkgdesc="Minimalist, fast, cross-platform terminal emulator"
arch=('x86_64')
url="https://terminalpp.com"
license=('MIT')
conflicts=('terminalpp' 'terminalpp-bin')
depends=('libxft' 'libxcursor' 'hicolor-icon-theme')
makedepends=('git' 'cmake' 'gcc10' 'imagemagick' 'cloc' 'doxygen' 'graphviz' 'libxext')
source=(git+https://github.com/terminalpp/terminalpp)
sha512sums=('SKIP')

pkgver() {
	cd terminalpp
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake -B terminalpp/build \
	      -S terminalpp \
	      -DCMAKE_BUILD_TYPE=None \
	      -DCMAKE_INSTALL_PREFIX=/usr \
	      -DCMAKE_C_COMPILER=gcc-10 \
	      -DCMAKE_CXX_COMPILER=g++-10 \
	      -DRENDERER=NATIVE \
	      -DINSTALL=terminalpp
	make -C terminalpp/build
}

package() {
	make DESTDIR="$pkgdir" -C terminalpp/build install
	install -Dm644 terminalpp/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
