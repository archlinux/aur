# Maintainer: MGislv <nocentinigabriele91@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=terminalpp
pkgver=0.8.4
pkgrel=3
pkgdesc="Minimalist, fast, cross-platform terminal emulator"
arch=('x86_64')
url="https://terminalpp.com"
license=('MIT')
conflicts=('terminalpp-git' 'terminalpp-bin')
depends=('libxft' 'libxcursor' 'hicolor-icon-theme')
makedepends=('cmake' 'gcc10' 'imagemagick' 'cloc' 'doxygen' 'graphviz' 'libxext')
source=($pkgname-$pkgver.tar.gz::https://github.com/terminalpp/terminalpp/archive/v$pkgver.tar.gz)
sha512sums=('498755b11e7e14d9aec4450e4f5a9446cb591fd73672ad306d2b292814b3bdbb10b0e6d6248f849b30f531a92f419881c7e59dcfa85117155c0e45aabb8943ad')

build() {
	cmake -B "$pkgname-$pkgver/build" \
	      -S "$pkgname-$pkgver" \
	      -DCMAKE_BUILD_TYPE=None \
	      -DCMAKE_INSTALL_PREFIX=/usr \
	      -DCMAKE_C_COMPILER=gcc-10 \
	      -DCMAKE_CXX_COMPILER=g++-10 \
	      -DRENDERER=NATIVE \
	      -DINSTALL=terminalpp
	make -C "$pkgname-$pkgver/build"
}

package() {
	make DESTDIR="$pkgdir" -C "$pkgname-$pkgver/build" install
	install -Dm644 "$pkgname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
