# Maintainer: Moritz Kaspar Rudert <me@mortzu.de>
# Contributors:
#  Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>
#  Antonio Rojas <arojas@archlinux.org>
pkgname=oxd4l
pkgver=0.0.1
pkgrel=1
pkgdesc='Open-Xchange drive client based on the Owncloud client'
arch=(i686 x86_64)
url='https://github.com/mortzu/OXd4L'
license=(GPL2)
depends=(qtkeychain-qt4 qtwebkit neon)
makedepends=(cmake python-sphinx)
optdepends=('python2-nautilus: integration with Nautilus')
conflicts=('owncloud-client')
install=$pkgname.install
backup=('etc/OXd4L/sync-exclude.lst')
source=('git+https://github.com/mortzu/OXd4L.git')
md5sums=('SKIP')

prepare() {
  mkdir -p build
}

build() {
  cd build

  cmake ../OXd4L \
        -DBUILD_WITH_QT4=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_SYSCONFDIR=/etc/$pkgname \

  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
