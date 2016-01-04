# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Eschwartz <eschwartz93@gmail.com>
# Contributors: Ner0, Sevenseven

pkgname=qbittorrent-git
pkgver=3.3.1.r0.gd753988
pkgrel=1
pkgdesc="A bittorrent client powered by C++, Qt5 and the good libtorrent library (development version)"
arch=('i686' 'x86_64')
url="http://www.qbittorrent.org/"
license=('custom' 'GPL')
depends=('libtorrent-rasterbar' 'qt5-base' 'desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('boost' 'git' 'qt5-tools')
optdepends=('python: needed for torrent search tab')
conflicts=('qbittorrent' 'qbittorrent-qt4')
provides=('qbittorrent' 'qbittorrent-qt5')
install=qbittorrent.install
source=(${pkgname%-*}::"git+https://github.com/qbittorrent/qBittorrent.git#branch=v3_3_x")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-*}

  git describe --long --tags | sed 's/^release-//;s/-/.r/;s/-/./'
}

build() {
  cd ${pkgname%-*}

  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname%-*}

  make INSTALL_ROOT="$pkgdir/" install
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
