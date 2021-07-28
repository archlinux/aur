# Maintainer: MGislv <nocentinigabriele91@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=terminalpp-git
pkgver=v0.8.4.r2.gca8811d
pkgrel=1
pkgdesc="Minimalist, fast, cross-platform terminal emulator"
arch=('x86_64')
url="https://terminalpp.com"
license=('MIT')
conflicts=('terminalpp' 'terminalpp-bin')
depends=('libxft' 'gcc-libs')
makedepends=('cmake' 'gcc10')
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
	      -DCMAKE_CXX_COMPILER=g++-10 \
	      -DCMAKE_INSTALL_PREFIX=/usr \
	      -DINSTALL=terminalpp \
	      ..
	make
}

package() {
	cd terminalpp/build
	DESTDIR="$pkgdir" make install

	install -Dm644 ../LICENSE.md "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
