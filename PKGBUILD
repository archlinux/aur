# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: Alois Nespor <info@aloisnespor.info>
# Contributor: speps <speps dot aur dot archlinux dot org>

pkgname=rssguard
pkgver=3.5.6
pkgrel=1
pkgdesc="A simple (yet powerful) Qt5 feed reader."
arch=('i686' 'x86_64')
url="https://github.com/martinrotter/rssguard/"
license=('GPL3')
depends=('qt5-base' 'qt5-webengine')
makedepends=('qt5-tools')
optdepends=('mariadb: MySQL/MariaDB storage backend support')
source=($pkgname-$pkgver.tar.gz::"https://github.com/martinrotter/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('8429b20e44fd394d6d053ed87b7e71ced9795f0d1b448621c475421f0e2daafa')

build() {
  cd $pkgname-$pkgver
  lrelease rssguard.pro
  qmake -r CONFIG+=release PREFIX=/usr

  make
}

package() {
  cd $pkgname-$pkgver
  make INSTALL_ROOT="$pkgdir/" install

  # install rssguard icon manually
  install -Dm644 resources/graphics/rssguard.png "$pkgdir/usr/share/pixmaps/rssguard.png"
}
