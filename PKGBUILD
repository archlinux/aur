# Maintainer: Alois Nespor <info@aloisnespor.info>
# Contributor: speps <speps dot aur dot archlinux dot org>

pkgname=rssguard
pkgver=3.2.4
pkgrel=2
pkgdesc="A simple (yet powerful) Qt5 feed reader."
arch=('i686' 'x86_64')
url="https://bitbucket.org/skunkos/rssguard"
license=('GPL3')
depends=('qt5-base')
makedepends=('cmake' 'qt5-tools')
optdepends=('mariadb: MySQL/MariaDB storage backend support')
provides=('rss-guard')
conflicts=('rss-guard' 'rssguard-git')
replaces=('rss-guard')
install="$pkgname.install"
source=("https://github.com/martinrotter/rssguard/archive/$pkgver.tar.gz")

prepare() {
  cd $pkgname-$pkgver
  [ -d b ] || mkdir b
}

build() {
  cd $pkgname-$pkgver/b
  cmake ../  -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=release
  make
}

package() {
  cd $pkgname-$pkgver/b
  make DESTDIR="$pkgdir/" install
}
sha256sums=('0285c4a6309c1bd6198302e007ff634d3f8ed8a03278eda143e6be8d90cf783e')
