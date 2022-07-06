# Maintainer: Yufan You <ouuansteve at gmail>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Jkkyll Wu <adaptee at gmail [dot] com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>

pkgname=qbittorrent-libtorrent-v1
pkgver=4.4.3.1
pkgrel=2
provides=('qbittorrent')
conflicts=('qbittorrent')
pkgdesc='An advanced BitTorrent client programmed in C++, based on Qt toolkit and libtorrent-rasterbar v1'
arch=('x86_64')
url='https://www.qbittorrent.org'
license=(custom GPL)
depends=(libtorrent-rasterbar-1 qt6-base qt6-svg hicolor-icon-theme)
makedepends=(cmake boost qt6-tools qt6-svg)
optdepends=('python: needed for torrent search tab')
source=("https://downloads.sourceforge.net/sourceforge/qbittorrent/qbittorrent-$pkgver.tar.xz"
        https://github.com/qbittorrent/qBittorrent/commit/73bce485.patch)
sha256sums=('b64559ca50b54bc6c5be17302e69f34fba8433059842aa4093865dc2c00d24c8'
            'ba43c4cb27065a75555fb9d88e63cadbc4db6d397e6486617da72244b713602b')

prepare() {
  patch -d "qbittorrent-$pkgver" -p1 < 73bce485.patch # Fix retrieving RSS feeds
}

build() {
  cmake -B build -S "qbittorrent-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DQT6=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "qbittorrent-$pkgver/COPYING" -t "$pkgdir/usr/share/licenses/$pkgname"
}
