# Maintainer: Alois Nespor <info@aloisnespor.info>
# Contributor: speps <speps dot aur dot archlinux dot org>

pkgname=rssguard
pkgver=2.5.0
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
sha256sums=('98128938844b485a318144dd58d72e0372273d60a7e7f9c5dbbfca7e48f9936d')
