# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kscreenlocker-git
pkgver=r764.dee0f32
pkgrel=1
pkgdesc='Library and components for secure lock screen architecture'
arch=(i686 x86_64)
url='https://projects.kde.org/kscreenlocker'
license=(LGPL)
depends=(plasma-framework-git kidletime-git kwayland-git libxcursor)
makedepends=(extra-cmake-modules-git git python kdoctools-git)
provides=(kscreenlocker)
conflicts=(kscreenlocker)
source=('git://anongit.kde.org/kscreenlocker.git')
md5sums=('SKIP')

pkgver() {
  cd kscreenlocker
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kscreenlocker \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DSYSCONF_INSTALL_DIR=/etc \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
