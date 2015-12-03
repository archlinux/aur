# Maintainer: maz-1 <ohmygod19993 at gmail dot com>

pkgname=kcm-servicemenus-frameworks
pkgver=0.4
pkgrel=3
pkgdesc="KF5 System Settings module to manage service menus"
arch=('i686' 'x86_64')
depends=('kdelibs4support' 'knewstuff' 'ki18n')
makedepends=('cmake' 'kdoctools' 'extra-cmake-modules')
url="http://www.kde-look.org/content/show.php/Service+Menu+Manager?content=94996"
license=('GPL')
conflicts=kcm-servicemenus
replaces=kcm-servicemenus
source=(kcm-servicemenus_$pkgver.tar.gz port_to_kf5.patch l10n_zh_cn.patch)
md5sums=('SKIP' 'SKIP' 'SKIP')

prepare() {
  mkdir -p $srcdir/build
  cd $srcdir/kcm-servicemenus-$pkgver
  patch -p1 -i $srcdir/port_to_kf5.patch
  patch -p1 -i $srcdir/l10n_zh_cn.patch
}

build() {
  cd $srcdir/build
  cmake -DCMAKE_BUILD_TYPE=Release \
     -DCMAKE_INSTALL_PREFIX=`kf5-config --prefix` \
     -DBUILD_TESTING=OFF \
     -DLIB_INSTALL_DIR=lib \
     -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
     ../kcm-servicemenus-$pkgver
  make
}

package() {
  cd $srcdir/build
  make DESTDIR=${pkgdir} install
}
