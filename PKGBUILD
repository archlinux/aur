# Maintainer: Alois Nespor <info@aloisnespor.info>
# Contributor: speps <speps dot aur dot archlinux dot org>

pkgname=rssguard
pkgver=2.5.1
pkgrel=1
pkgdesc="A simple (yet powerful) Qt5 feed reader."
arch=('i686' 'x86_64')
url="https://bitbucket.org/skunkos/rssguard"
license=('GPL3')
depends=('qt5-webkit')
makedepends=('cmake' 'qt5-tools')
optdepends=('mariadb: MySQL/MariaDB storage backend support')
provides=('rss-guard')
conflicts=('rss-guard' 'rssguard-git')
replaces=('rss-guard')
install="$pkgname.install"
source=("https://bitbucket.org/skunkos/rssguard/get/$pkgver.tar.gz")

prepare() {
  cd skunkos*
  [ -d b ] || mkdir b
}

build() {
  cd skunkos*/b
  cmake ../ -DUSE_QT_5=ON -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=release
  make
}

package() {
  cd skunkos*/b
  make DESTDIR="$pkgdir/" install
}
sha256sums=('f7521b17585b29c17c9108ad782cadd8613a5f17930b3c9954840b60d897c14f')
