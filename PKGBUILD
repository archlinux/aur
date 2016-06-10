
# Maintainer: Malte Veerman <maldela@halloarsch.de>

_srcname=fancontrol-gui
pkgname=fancontrol-kcm-git
pkgver=v0.3.r29.gb41ae5f
pkgrel=1
pkgdesc="KCM for the fancontrol script and systemd service"
arch=('i686' 'x86_64')
url="https://github.com/Maldela/Fancontrol-GUI"
license=('GPL2')
depends=('fancontrol-gui-git')
makedepends=('git' 'extra-cmake-modules' )
provides=('fancontrol-kcm')
conflicts=('fancontrol-kcm')
source=('git://github.com/Maldela/fancontrol-gui.git')
md5sums=('SKIP')


pkgver() {
  cd "$srcdir/$_srcname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p "$srcdir/$_srcname/build"
}


build() {
  msg "Starting build..."

  cd "$srcdir/$_srcname/build"

  cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DLIB_INSTALL_DIR=lib \
        -DBUILD_TESTING=off \
        -DBUILD_GUI=off \
        -DBUILD_KCM=on \
        -DINSTALL_SHARED=off \
        -DINSTALL_HELPER=off
  make
}

package() {
  cd "$srcdir/$_srcname/build"
  make DESTDIR="$pkgdir/" install
}
