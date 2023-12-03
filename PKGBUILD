# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Leo <i@setuid0.dev>
pkgname=qbittorrent-enhanced
pkgver=4.6.2.10
pkgrel=1
epoch=
pkgdesc="A bittorrent client powered by C++, Qt and the good libtorrent library (Enhanced Edition)"
arch=('x86_64')
url="https://github.com/c0re100/qBittorrent-Enhanced-Edition"
license=('GPL' 'custom')
groups=()
depends=('gcc-libs' 'glibc' 'libtorrent-rasterbar' 'openssl' 'qt6-base' 'qt6-svg' 'hicolor-icon-theme' 'zlib')
makedepends=('cmake' 'boost>=1.65' 'qt6-tools')
checkdepends=()
optdepends=('python: needed for torrent search tab')
provides=('qbittorrent')
conflicts=('qbittorrent')
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/c0re100/qBittorrent-Enhanced-Edition/archive/release-$pkgver.tar.gz")
noextract=()
sha256sums=('22ad828e4addecabae208ffb29e79da43bbda8c51294fda3da400bbf04ed81db')

build() {
	cd qBittorrent-Enhanced-Edition-release-$pkgver

	cmake -B build -S . \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DQT6=ON
	cmake --build build
}

package() {
	cd qBittorrent-Enhanced-Edition-release-$pkgver

	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
