# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=minitube
pkgver=2.6
pkgrel=1
pkgdesc="A native YouTube client in Qt. Watch YouTube videos without Flash Player"
arch=('i686' 'x86_64')
url='http://flavio.tordini.org/minitube'
license=('GPL3')
depends=('phonon-qt5' 'qt5-declarative' 'hicolor-icon-theme')
makedepends=('qt5-tools')
install="$pkgname.install"
backup=('etc/profile.d/minitube.sh')
source=($pkgname-$pkgver.tar.gz::"https://github.com/flaviotordini/minitube/archive/$pkgver.tar.gz" $pkgname.sh)
md5sums=('229fbde4ea32c843051221d71c1fcd36'
         '01d1d532dd7f4670cf7f33f007863b7a')

build() {
  cd $pkgname-$pkgver
  qmake
}

package() {
  cd $pkgname-$pkgver
  make install INSTALL_ROOT="$pkgdir/"

  # GOOGLE_API_KEY
  install -Dm644 ../$pkgname.sh \
    "$pkgdir/etc/profile.d/$pkgname.sh"
}
