# Maintainer: selpast <selpast@pm.me>

pkgname=qbittorrent-qt5
pkgver=4.4.1
pkgrel=1
pkgdesc='An advanced BitTorrent client programmed in C++, based on Qt5 toolkit and libtorrent-rasterbar'
arch=(x86_64)
url='https://www.qbittorrent.org'
license=(custom GPL)
depends=(hicolor-icon-theme libtorrent-rasterbar qt5-base qt5-svg)
makedepends=(boost cmake qt5-tools)
optdepends=('python: needed for torrent search tab')
conflicts=('qbittorrent')
provides=('qbittorrent')
source=(https://downloads.sourceforge.net/sourceforge/qbittorrent/${pkgname%-*}-${pkgver}.tar.xz{,.asc})
sha256sums=('1386f000ce1d791469c3ea03e3951ca25f67f534e66896592bd12357dda9a8ec'
            'SKIP')
validpgpkeys=('D8F3DA77AAC6741053599C136E4A2D025B7CC9A2')
build() {
  cd ${pkgname%-*}-${pkgver}

	cmake -B build -S . \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DQT6=OFF
	cmake --build build
}

package() {
  cd ${pkgname%-*}-${pkgver}

  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}