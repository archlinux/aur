# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Bhushan Shah <bhush94 at gmail dot com>

pkgname=plasma-mediacenter
pkgver=5.7.5
pkgrel=1
pkgdesc="A mediacenter user interface based on KDE Plasma components"
arch=(x86_64)
url="https://community.kde.org/Plasma/Plasma_Media_Center/"
license=(GPL3)
depends=(plasma-workspace baloo)
makedepends=(extra-cmake-modules)
source=("https://download.kde.org/stable/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('dd0df7dbc3e51ec4e329a6365c25b2b2e3d6e4dd7fd8e0aa916f3f9559a863bf'
            'SKIP')
validpgpkeys=('2D1D5B0588357787DE9EE225EC94D18F7F05997E'  # Jonathan Riddell
              '348C8651206633FD983A8FC4DEACEA00075E1D76'  # KDE Neon
              'D07BD8662C56CB291B316EB2F5675605C74E02CF') # David Edmundson

prepare() {
  mkdir -p build
}    

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_TESTING=OFF
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
