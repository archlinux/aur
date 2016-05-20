# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Antonio Rojas

pkgname=ksysguard
pkgver=5.6.4
pkgrel=1
pkgdesc='Track and control the processes running in your system'
arch=('i686' 'x86_64')
url='https://userbase.kde.org/KSysGuard'
license=('LGPL')
depends=('knewstuff' 'libksysguard' 'lm_sensors' 'xdg-utils'
         'hicolor-icon-theme' 'kdelibs4support')
makedepends=('extra-cmake-modules' 'kdoctools' 'python')
conflicts=('kdebase-workspace')
groups=('plasma')
source=("http://download.kde.org/stable/plasma/${pkgver}/$pkgname-$pkgver.tar.xz")
md5sums=('d05d3d5dc685314f11eafa8356a18445')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
