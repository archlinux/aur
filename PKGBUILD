# Maintainer: MGislv <nocentinigabriele91@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=terminalpp
pkgver=0.8.4
pkgrel=1
pkgdesc="Minimalist, fast, cross-platform terminal emulator"
arch=('x86_64')
url="https://terminalpp.com"
license=('MIT')
conflicts=('terminalpp-git' 'terminalpp-bin')
depends=('libxft' 'gcc-libs')
makedepends=('cmake' 'gcc10')
source=(https://github.com/terminalpp/terminalpp/archive/v$pkgver.tar.gz)
sha512sums=('498755b11e7e14d9aec4450e4f5a9446cb591fd73672ad306d2b292814b3bdbb10b0e6d6248f849b30f531a92f419881c7e59dcfa85117155c0e45aabb8943ad')

prepare() {
	mkdir -p "$pkgname-$pkgver"/build
}

build() {
	cd "$pkgname-$pkgver"/build
	cmake -DCMAKE_BUILD_TYPE=None \
	      -DCMAKE_CXX_COMPILER=g++-10 \
	      -DCMAKE_INSTALL_PREFIX=/usr \
	      -DINSTALL=terminalpp \
	      ..
	make
}

package() {
	cd "$pkgname-$pkgver"/build
	DESTDIR="$pkgdir" make install

	install -Dm644 ../LICENSE.md "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
