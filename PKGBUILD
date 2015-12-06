# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=minitube
pkgver=2.4
pkgrel=2
pkgdesc="A native YouTube client in Qt. Watch YouTube videos without Flash Player"
arch=('i686' 'x86_64')
url='http://flavio.tordini.org/minitube'
license=('GPL3')
depends=('phonon-qt4')
install="$pkgname.install"
backup=('etc/profile.d/minitube.sh')
source=("https://github.com/flaviotordini/minitube/archive/$pkgver.tar.gz" $pkgname.sh)
md5sums=('90e8f7c8adfe633553e08d98edd77961'
         '01d1d532dd7f4670cf7f33f007863b7a')

build() {
  cd $pkgname-$pkgver
  qmake-qt4
}

package() {
  cd $pkgname-$pkgver
  make install INSTALL_ROOT="$pkgdir/"

  # GOOGLE_API_KEY
  install -Dm644 ../$pkgname.sh \
    "$pkgdir/etc/profile.d/$pkgname.sh"
}
