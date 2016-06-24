# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Maintainer: Eschwartz <eschwartz93@gmail.com>
# Contributors: Ner0, Sevenseven

# All my PKGBUILDs are managed at https://github.com/eli-schwartz/pkgbuilds

pkgname=qbittorrent-git
pkgver=3.3.5.r602.gdbd079d
pkgrel=2
pkgdesc="A bittorrent client powered by C++, Qt5 and the good libtorrent library (development version)"
arch=('i686' 'x86_64')
url="http://www.qbittorrent.org/"
license=('custom' 'GPL')
depends=('libtorrent-rasterbar' 'qt5-base')
makedepends=('boost' 'git' 'qt5-tools')
optdepends=('python: needed for torrent search tab')
conflicts=('qbittorrent')
provides=('qbittorrent')
source=("${pkgname%-*}::git+https://github.com/qbittorrent/qBittorrent.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-*}

  _tag=$(git tag -l | sort -r | head -n1 | tr -cd 0-9.)
  _rev=$(git rev-list --count release-${_tag}..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash"
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
