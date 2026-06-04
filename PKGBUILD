# Maintainer: Leo <i@hardrain980.com>
pkgname=qbittorrent-enhanced
pkgver=5.2.1.10
pkgrel=1
pkgdesc="A bittorrent client powered by C++, Qt and libtorrent (Enhanced Edition)"
arch=('x86_64')
url="https://github.com/c0re100/qBittorrent-Enhanced-Edition"
license=('GPL-2.0-or-later')
depends=('gcc-libs' 'glibc' 'libtorrent-rasterbar' 'openssl>=3.0.2' 'qt6-base>=6.6.0' 'qt6-svg' 'hicolor-icon-theme' 'zlib')
makedepends=('cmake>=3.16' 'boost>=1.76' 'qt6-tools')
optdepends=('python: needed for torrent search tab')
provides=('qbittorrent')
conflicts=('qbittorrent')
source=("qbittorrent-enhanced-$pkgver.tar.gz::https://github.com/c0re100/qBittorrent-Enhanced-Edition/archive/release-$pkgver.tar.gz")
sha256sums=('ee5e05db67ba52a9380b01501260473bcd6595b4750c5775c037ed3b6815e30b')

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
