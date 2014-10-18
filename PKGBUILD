# Contributor: Antonio Rojas

pkgname=ksysguard
pkgver=5.1.0.1
pkgrel=1
pkgdesc='KSysGuard'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/workspace/ksysguard'
license=('LGPL')
depends=('knewstuff' 'libksysguard' 'lm_sensors')
makedepends=('extra-cmake-modules' 'kdoctools' 'python')
conflicts=('kdebase-workspace')
source=("http://download.kde.org/stable/plasma/5.1.0/$pkgname-$pkgver.tar.xz")
md5sums=('48e32cec871bc7ab670df3ddef37bf6b')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-5.1.0 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DSYSCONF_INSTALL_DIR=/etc \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
