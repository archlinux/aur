# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Eschwartz <eschwartz93@gmail.com>
# Contributors: Ner0, Sevenseven

pkgname=qbittorrent-git
pkgver=3.2.3.r0.g56beb0d
pkgrel=1
pkgdesc="A bittorrent client written in C++ / Qt4 using the good libtorrent library (development version)"
arch=('i686' 'x86_64')
url="http://www.qbittorrent.org/"
license=('custom' 'GPL')
depends=('qt4' 'libtorrent-rasterbar' 'qjson')
makedepends=('boost' 'git')
optdepends=('python: needed for torrent search tab')
conflicts=('qbittorrent' 'qbittorrent-qt5')
provides=('qbittorrent' 'qbittorrent-qt4')
install=qbittorrent.install
source=(${pkgname%-*}::"git+https://github.com/qbittorrent/qBittorrent.git#branch=v3_2_x")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-*}

  git describe --long --tags | sed 's/^release-//;s/-/.r/;s/-/./'
}

build() {
  cd ${pkgname%-*}

  ./configure --prefix=/usr --with-qjson=system
  make
}

package() {
  cd ${pkgname%-*}

  make INSTALL_ROOT="$pkgdir/" install
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
