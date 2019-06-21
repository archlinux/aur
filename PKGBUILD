# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Michael DÃ¼ll <mail@akurei.me> PGP-Key: 6D666EC8
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Roozbeh Shafiee <Roozbeh@Roozbeh.us>

pkgname=choqok-git
pkgver=v1.6.0.r106.gd8a53169
pkgrel=1
pkgdesc='Microblogging client for KDE with support for Pump.io, GNU social and Twitter.com - git version'
arch=(i686 x86_64)
url='https://choqok.kde.org/'
license=(GPL)
depends=(knotifyconfig kcmutils kemoticons qt5-networkauth)
makedepends=(extra-cmake-modules git kdoctools python qca-qt5)
conflicts=(choqok)
provides=(choqok)
replaces=(choqok-frameworks-git)
source=("git+https://github.com/KDE/choqok.git")
install=$pkgname.install
sha256sums=('SKIP')

pkgver() {
  cd choqok
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
}

build() { 
  cd build
  cmake ../choqok \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
