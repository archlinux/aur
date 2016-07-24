# Maintainer: Alois Nespor <info@aloisnespor.info>
# Contributor: speps <speps dot aur dot archlinux dot org>

pkgname=rssguard
pkgver=3.3.2
pkgrel=1
pkgdesc="A simple (yet powerful) Qt5 feed reader."
arch=('i686' 'x86_64')
url="https://github.com/martinrotter/rssguard/"
license=('GPL3')
depends=('qt5-base>=5.7.0' 'qt5-webengine')
makedepends=('qt5-tools')
optdepends=('mariadb: MySQL/MariaDB storage backend support')
provides=('rss-guard')
conflicts=('rss-guard' 'rssguard-git')
replaces=('rss-guard')
source=("https://github.com/martinrotter/rssguard/archive/$pkgver.tar.gz")


build() {
  cd $pkgname-$pkgver
  qmake-qt5 -r CONFIG+=release PREFIX=/usr INSTALL_ROOT=. LRELEASE_EXECUTABLE=lrelease-qt5  QMAKE_CFLAGS_RELEASE="$CPPFLAGS $CFLAGS" QMAKE_CXXFLAGS_RELEASE="$CPPFLAGS $CXXFLAGS" QMAKE_LFLAGS_RELEASE="$LDFLAGS"
  make
}

package() {
  cd $pkgname-$pkgver
  make INSTALL_ROOT="$pkgdir/" install
}
sha256sums=('bc68360997552cb4da1e8169a2bf1cc48acfa2f5a6f4aab02c805fd2671159e2')
