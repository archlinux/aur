# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Jkkyll Wu <adaptee at gmail [dot] com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>

pkgname=qbittorrent-stable-git
pkgver=3.3.1.r0.gd753988
pkgrel=1
pkgdesc="An advanced BitTorrent client programmed in C++, based on Qt toolkit and libtorrent-rasterbar. Built from source."
arch=('i686' 'x86_64')
url="http://www.qbittorrent.org"
license=('custom' 'GPL')
depends=('libtorrent-rasterbar' 'qt5-base' 'desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('boost' 'git' 'qt5-tools')
optdepends=('python: needed for torrent search tab')
install=${pkgname%-*-*}.install
source=("${pkgname%-*-*}"::"git+https://github.com/qbittorrent/qBittorrent.git#branch=v3_3_x")
sha256sums=('SKIP')
pkgver() {
  cd $srcdir/${pkgname%-*-*}
  git describe --long --tags | sed 's/^release-//;s/-/.r/;s/-/./'
}

build() {
  cd $srcdir/${pkgname%-*-*}
  ./configure --prefix=/usr
  make -j$(nproc)
}

package() {
  cd $srcdir/${pkgname%-*-*}
  make INSTALL_ROOT="$pkgdir/" install
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
