# Maintainer: Boohbah <boohbah at gmail.com>
# Contributor: Mikkel Kroman <mk@maero.dk>
# Contributor: AlexTalker <alextalker at openmailbox.org>
# Contributor: Loui Chang <louipc.ist at gmail.com>
# Contributor: anaveragehuman <anaveragehuman.0 at gmail.com>

pkgname=ricochet-git
pkgver=1.1.2.r0.g6cfbcd0
pkgrel=1
pkgdesc="A peer-to-peer instant messaging system built on Tor hidden services (git version)"
arch=('i686' 'x86_64')
url="https://ricochet.im/"
license=('custom')
depends=('hicolor-icon-theme' 'protobuf' 'qt5-translations' 'qt5-quickcontrols'
         'qt5-quick1' 'qt5-multimedia' 'tor')
makedepends=('git' 'qt5-tools' 'gtk-update-icon-cache')
conflicts=('ricochet')
provides=('ricochet')
source=("$pkgname::git+https://github.com/ricochet-im/ricochet.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "$pkgname"
  qmake-qt5 CONFIG+=release DEFINES+=RICOCHET_NO_PORTABLE
  make
}

package() {
  cd "$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  INSTALL_ROOT="$pkgdir" make install
}
