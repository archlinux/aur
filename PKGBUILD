# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
# Contributor: Darwin Bautista <djclue917@gmail.com>
# Contributor: Jakub Luzny <limoto94@gmail.com>
pkgname=netpanzer
pkgver=0.8.7
pkgrel=1
pkgdesc="An online multiplayer tactical warfare game"
arch=('i686' 'x86_64')
url="http://www.netpanzer.info/"
license=('GPL')
depends=('sdl_mixer')
makedepends=('scons')
changelog=netpanzer.changelog
source=(http://www.netpanzer.info/Download/NetPanzer/Releases/0.8.7/netpanzer-0.8.7-source.zip)
md5sums=('712327f3a1aef40c174a507019b01ad7')

build() {
  cd "$srcdir"
  scons datadir=/usr/share/netpanzer
}

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir"/usr/share/netpanzer
  cp -pR cache maps pics powerups scripts sound units wads "$pkgdir"/usr/share/netpanzer
  chmod -R o+r "$pkgdir"/usr/share/netpanzer/
  find "$pkgdir"/usr/share/netpanzer/ -type d -exec chmod o+x {} \;

  install -Dm755 netpanzer "$pkgdir"/usr/bin/netpanzer
  install -Dm644 support/win32/netpanzer.desktop "$pkgdir"/usr/share/applications/netpanzer.desktop
  install -Dm644 netpanzer.png "$pkgdir"/usr/share/pixmaps/netpanzer.png
}
