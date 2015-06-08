# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Michael DÃ¼ll <mail@akurei.me> PGP-Key: 6D666EC8
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Roozbeh Shafiee <Roozbeh@Roozbeh.us>

pkgname=choqok-git
pkgver=r1830.5f0ea6f
pkgrel=1
pkgdesc='Microblogging client for KDE with support for Pump.io, GNU social and Twitter.com'
arch=(i686 x86_64)
url='http://choqok.gnufolks.org/'
license=(GPL)
depends=(knotifyconfig kcmutils kemoticons qoauth-git)
makedepends=(extra-cmake-modules git kdoctools python)
conflicts=(choqok)
provides=(choqok)
replaces=(choqok-frameworks-git)
source=("git://anongit.kde.org/choqok.git")
install=$pkgname.install
sha256sums=('SKIP')

pkgver() {
  cd choqok
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
