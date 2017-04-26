# Maintainer: Papajoke <papajoke [at] archlinux [dot] info>

pkgname=kdeplasma-wallpaperswitch
pkgver=1.0.0
pkgrel=2
_commit="4d468cba0364bcc540892b4a2dd612ec0133f7bd"
pkgdesc="A virtual desktop wallpaper switcher for KDE Plasma 5"
arch=('i686' 'x86_64')
url="https://github.com/martenjj/wallpaperswitch"
license=('GPL')
install=".install"
depends=('plasma-workspace')
makedepends=('extra-cmake-modules')
source=("https://github.com/martenjj/wallpaperswitch/archive/${_commit}.zip")
sha512sums=('34edab82caad9d1435c08698d6c3a62ff3174c6367f11b46f42f280256238d7630bc69e65ed4d92cc6f69c768baa3882f003a92e683fc27d891ec8190a137f19')

build() {
  cd "$srcdir/wallpaperswitch-${_commit}"
  rm -rf build 
  mkdir build
  cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_LIBEXECDIR=lib \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package(){
  cd "$srcdir/wallpaperswitch-${_commit}/build"
  make DESTDIR="$pkgdir/" install
}
