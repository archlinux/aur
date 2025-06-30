# Maintainer: Leo <i@hardrain980.com>
pkgname=qbittorrent-enhanced
pkgver=5.1.1.10
pkgrel=1
pkgdesc="A bittorrent client powered by C++, Qt and libtorrent (Enhanced Edition)"
arch=('x86_64')
url="https://github.com/c0re100/qBittorrent-Enhanced-Edition"
license=('GPL-2.0-or-later')
depends=('gcc-libs' 'glibc' 'libtorrent-rasterbar' 'openssl>=3.0.2' 'qt6-base>=6.5.0' 'qt6-svg' 'hicolor-icon-theme' 'zlib')
makedepends=('cmake>=3.16' 'boost>=1.76' 'qt6-tools')
optdepends=('python: needed for torrent search tab')
provides=('qbittorrent')
conflicts=('qbittorrent')
source=("qbittorrent-enhanced-$pkgver.tar.gz::https://github.com/c0re100/qBittorrent-Enhanced-Edition/archive/release-$pkgver.tar.gz")
sha256sums=('ce2b96811a4f12ad6dde21a458d506dad947c221dd8ff560778dbb62089c4262')

build() {
	cd qBittorrent-Enhanced-Edition-release-$pkgver

	cmake -B build -S . -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	cd qBittorrent-Enhanced-Edition-release-$pkgver

	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
