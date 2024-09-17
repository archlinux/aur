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
pkgver=4.6.7
pkgrel=1
provides=('qbittorrent')
conflicts=('qbittorrent')
pkgdesc='An advanced BitTorrent client programmed in C++, based on Qt toolkit and libtorrent-rasterbar v1'
arch=('x86_64')
url='https://www.qbittorrent.org'
license=('GPL-3.0-or-later AND OpenSSL')
depends=(
    gcc-libs
    glibc
    hicolor-icon-theme
    libtorrent-rasterbar-1
    openssl
    qt6-base
    qt6-svg
    zlib
)
makedepends=(cmake boost qt6-tools)
optdepends=('python: needed for torrent search tab')
source=("https://downloads.sourceforge.net/sourceforge/qbittorrent/qbittorrent-$pkgver.tar.xz")
sha256sums=('bcf2dcf52a0186c3f5da2f1413453888654dc1aee5e4ad80e5a026764bc640c4')

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
