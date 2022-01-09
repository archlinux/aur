# Maintainer: selpast <selpast@pm.me>

pkgname=qbittorrent-qt5
pkgver=4.4.0
pkgrel=3
pkgdesc='An advanced BitTorrent client programmed in C++, based on Qt5 toolkit and libtorrent-rasterbar'
arch=(x86_64)
url='https://www.qbittorrent.org'
license=(custom GPL)
depends=(hicolor-icon-theme libtorrent-rasterbar qt5-base qt5-svg)
makedepends=(boost cmake qt5-tools)
optdepends=('python: needed for torrent search tab')
conflicts=('qbittorrent')
provides=('qbittorrent')
source=(https://downloads.sourceforge.net/sourceforge/qbittorrent/${pkgname%-*}-${pkgver}.tar.xz)
sha256sums=('6b783a88c7bd567e48cd9f20c67b788776ee2a6d474fe3df4af216acbdfe501b',
            'SKIP')
validpgpkeys=('D8F3DA77AAC6741053599C136E4A2D025B7CC9A2')
build() {
  cd ${pkgname%-*}-${pkgver}

  # tell qmake not to break makepkg's debug/!strip options
  export QBT_ADD_CONFIG='nostrip'

  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname%-*}-${pkgver}

  make INSTALL_ROOT="${pkgdir}" install
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}