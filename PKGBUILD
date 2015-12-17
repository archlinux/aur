# Maintainer: AJSlye (jameskittsmiller@gmail.com) / Bernhard Landauer <oberon@manjaro.org>

pkgname=plasma-wallpaper-snow
pkgver=20151128
pkgrel=1
_snapshot=89d9d94c5369e027f234ad9f3af02645fd103d90
pkgdesc='Snowfall Live Wallpaper for KDE Plasma 5'
arch=('i686' 'x86_64')
url="https://github.com/IvanSafonov/$pkgname"
license=('LGPL')
depends=('plasma-desktop')
makedepends=('git'
	'extra-cmake-modules'
	'kdoctools'
	'plasma-framework'
	'python')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_snapshot.tar.gz")
md5sums=('3f194f36c431b6aead3fe805929ad29f')

build() {
  cd $srcdir/$pkgname-$_snapshot
  
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
  cd $srcdir/$pkgname-$_snapshot/build
  make DESTDIR="${pkgdir}" install
}
