# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
# Contributor: Darwin Bautista <djclue917@gmail.com>
# Contributor: Jakub Luzny <limoto94@gmail.com>
pkgname=netpanzer
pkgver=0.8.4
pkgrel=1
pkgdesc="An online multiplayer tactical warfare game"
arch=('i686' 'x86_64')
url="http://www.netpanzer.org/"
license=('GPL')
depends=('gcc-libs' 'sdl_mixer')
makedepends=('subversion' 'scons')
changelog=netpanzer.changelog
source=()
md5sums=()

_svntag=svn://svn.berlios.de/netpanzer/tags/netpanzer/0.8.4

build() {
  cd "$srcdir"
  svn export $_svntag netpanzer-$pkgver
  cd netpanzer-$pkgver

  scons datadir=/usr/share/netpanzer
}

package() {
  cd "$srcdir/netpanzer-$pkgver"
  mkdir -p "$pkgdir"/usr/share/netpanzer
  cp -pR cache maps pics powerups scripts sound \
    units wads "$pkgdir"/usr/share/netpanzer

  install -Dm755 netpanzer "$pkgdir"/usr/bin/netpanzer
  install -Dm644 netpanzer.desktop "$pkgdir"/usr/share/applications/netpanzer.desktop
  install -Dm644 netpanzer.png "$pkgdir"/usr/share/pixmaps/netpanzer.png
}
