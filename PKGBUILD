# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Antonio Rojas

pkgname=ksysguard
pkgver=5.8.2
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
sha256sums=('d6ee1f2b83471c6e5cd3774c7a4b1e86c9a42d779f37c551d8721dbb8011cfd7'
            'SKIP')
validpgpkeys=('2D1D5B0588357787DE9EE225EC94D18F7F05997E'  # Jonathan Riddell
              '348C8651206633FD983A8FC4DEACEA00075E1D76'  # KDE Neon
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
