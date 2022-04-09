# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=rssguard
pkgname=$_pkgname-git
pkgver=3.5.9.8.gf12c395e
pkgrel=1
pkgdesc='Simple, lightweight and easy-to-use RSS/ATOM feed aggregator developed using Qt'
arch=('i686' 'x86_64')
url='https://github.com/martinrotter/rssguard'
license=('GPL3')
depends=('qt5-webengine')
optdepends=('oxygen-icons: fallback icon theme')
makedepends=('git' 'cmake' 'qt5-tools')
provides=("$_pkgname")
conflicts=("$_pkgname" rss-guard{,-git})
source=("git+${url}.git")
sha256sums=("SKIP")

pkgver() {
  cd $_pkgname
  git describe --always | sed 's:-:.:g'
}

build() {
  rm -Rf build && mkdir build
  cd build
  cmake $srcdir/$_pkgname/ -DCMAKE_BUILD_TYPE=debug -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR=$pkgdir install
}
