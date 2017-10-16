# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: Alois Nespor <info@aloisnespor.info>
# Contributor: speps <speps dot aur dot archlinux dot org>

pkgname=rssguard
pkgver=3.5.1
pkgrel=1
pkgdesc="A simple (yet powerful) Qt5 feed reader."
arch=('i686' 'x86_64')
url="https://github.com/martinrotter/rssguard/"
license=('GPL3')
depends=('qt5-base')
makedepends=('qt5-tools')
optdepends=('mariadb: MySQL/MariaDB storage backend support'
            'qt5-webengine: more feature and support of browsing' )
source=($pkgname-$pkgver.tar.gz::"https://github.com/martinrotter/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('c21a4e357dfd518ec658f8733136940c50d8eee10d54c355465af9c39fa9123a')


build() {
  cd $pkgname-$pkgver
  qmake -r CONFIG+=release PREFIX=/usr INSTALL_ROOT=. LRELEASE_EXECUTABLE=lrelease-qt5
  make

  # run qmake a second time to ensure translations are generated
  # https://github.com/martinrotter/rssguard/blob/master/resources/scripts/.travis-install-linux.sh#L8
  qmake -r CONFIG+=release PREFIX=/usr INSTALL_ROOT=. LRELEASE_EXECUTABLE=lrelease-qt5
}

package() {
  cd $pkgname-$pkgver
  make INSTALL_ROOT="$pkgdir/" install

  # install rssguard icon manually
  install -Dm644 resources/graphics/rssguard.png "$pkgdir/usr/share/pixmaps/rssguard.png"
}
