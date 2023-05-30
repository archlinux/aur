# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Leo <i@setuid0.dev>
pkgname=qbittorrent-enhanced
pkgver=4.5.3.10
pkgrel=1
epoch=
pkgdesc="A bittorrent client powered by C++, Qt and the good libtorrent library (Enhanced Edition)"
arch=('x86_64')
url="https://github.com/c0re100/qBittorrent-Enhanced-Edition"
license=('GPL' 'custom')
groups=()
depends=('libtorrent-rasterbar' 'qt6-base' 'qt6-svg' 'hicolor-icon-theme')
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
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/c0re100/qBittorrent-Enhanced-Edition/archive/release-$pkgver.tar.gz"
	"COPYING::https://raw.githubusercontent.com/c0re100/qBittorrent-Enhanced-Edition/v4_5_x/COPYING"
	"COPYING.GPLv2::https://raw.githubusercontent.com/c0re100/qBittorrent-Enhanced-Edition/v4_5_x/COPYING.GPLv2"
	"COPYING.GPLv3::https://raw.githubusercontent.com/c0re100/qBittorrent-Enhanced-Edition/v4_5_x/COPYING.GPLv3"
)
noextract=()
sha256sums=(
	'4e152e50b0fe9429c96629d6899852cf0c2a3d9c42b0a403283fe89e3606fe28'
	'SKIP'
	'SKIP'
	'SKIP'
)

build() {
	cd qBittorrent*$pkgver

	cmake -B build -S . \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DQT6=ON
	cmake --build build
}

package() {
	cd qBittorrent*$pkgver

	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
	install -Dm644 COPYING.GPLv2 "$pkgdir"/usr/share/licenses/$pkgname/COPYING.GPLv2
	install -Dm644 COPYING.GPLv3 "$pkgdir"/usr/share/licenses/$pkgname/COPYING.GPLv3
}
