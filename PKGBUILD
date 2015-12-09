# Maintainer: AJSlye (jameskittsmiller@gmail.com) / Bernhard Landauer <oberon@manjaro.org>

pkgname=plasma-wallpaper-snow
pkgver=r5.89d9d94
pkgrel=1
pkgdesc='Snowfall Live Wallpaper for KDE Plasma 5'
arch=('i686' 'x86_64')
license=('LGPL')
depends=('plasma-desktop')
makedepends=('git'
	'extra-cmake-modules'
	'kdoctools'
	'plasma-framework'
	'python')
source=("git://github.com/IvanSafonov/plasma-wallpaper-snow.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/${pkgname}
  
  mkdir -p build
  cd build
  cmake ../ \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DLIBEXEC_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd ${srcdir}/${pkgname}/build
  make DESTDIR="${pkgdir}" install
}
