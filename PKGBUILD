# Maintainer: Boohbah <boohbah at gmail.com>
# Contributor: Mikkel Kroman <mk@maero.dk>
# Contributor: AlexTalker <alextalker at openmailbox.org>

pkgname=ricochet-git
pkgver=1.0.4.r40.g666b686
pkgrel=1
pkgdesc="A peer-to-peer instant messaging system built on Tor hidden services (git version)"
arch=('i686' 'x86_64')
url="https://ricochet.im/"
license=('custom')
depends=('tor' 'qt5-translations' 'qt5-quickcontrols' 'qt5-quick1'
         'qt5-declarative')
makedepends=('git' 'qt5-tools')
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
