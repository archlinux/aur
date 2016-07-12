# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Antonio Rojas

pkgname=ksysguard
pkgver=5.7.1
pkgrel=1
pkgdesc='Track and control the processes running in your system'
arch=('i686' 'x86_64')
url='https://userbase.kde.org/KSysGuard'
license=('LGPL')
depends=('knewstuff' 'libksysguard' 'lm_sensors' 'hicolor-icon-theme')
makedepends=('extra-cmake-modules' 'kdoctools' 'python')
conflicts=('kdebase-workspace')
groups=('plasma')
source=("http://download.kde.org/stable/plasma/${pkgver}/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('b2c4d1e26c2ed0daeb5f147510763338f53e0b34f9f61ce81f9868eaaee66991'
            'SKIP')
validpgpkeys=('13C16D03EDE728514473AA73A506E6D4DD4D5088'  # Jonathan Riddell
              'D07BD8662C56CB291B316EB2F5675605C74E02CF') # David Edmundson

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
