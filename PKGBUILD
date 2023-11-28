# Maintainer: selpast <selpast@pm.me>

_pkgname='qbittorrent'
pkgname=qbittorrent-qt5
pkgver=4.6.2
pkgrel=1
pkgdesc='An advanced BitTorrent client programmed in C++, based on Qt5 toolkit and libtorrent-rasterbar'
arch=(x86_64)
url='https://www.qbittorrent.org'
license=(custom GPL)
depends=(gcc-libs glibc hicolor-icon-theme libtorrent-rasterbar openssl qt5-base qt5-svg zlib)
makedepends=(boost cmake qt5-tools)
optdepends=('python: needed for torrent search tab')
conflicts=('qbittorrent')
provides=('qbittorrent')
source=(https://downloads.sourceforge.net/sourceforge/qbittorrent/${_pkgname}-${pkgver}.tar.xz{,.asc})
sha256sums=('e96bf2e49d5bf1a9970315af4e61ebc8e61d3f17e0ff1013d11881dbf4c233a0'
            'SKIP')
validpgpkeys=('D8F3DA77AAC6741053599C136E4A2D025B7CC9A2')

build() {
  cd ${_pkgname}-${pkgver}

	cmake -B build -S . \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DQT6=OFF
	cmake --build build
}

package() {
  cd ${_pkgname}-${pkgver}

  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$_pkgname/COPYING
}
