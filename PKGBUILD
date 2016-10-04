# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=libkscreen
pkgver=5.8.0
pkgrel=1
pkgdesc='KDE screen management software'
arch=('i686' 'x86_64')
url='https://www.kde.org/workspaces/plasmadesktop/'
license=('LGPL')
depends=('qt5-x11extras' 'libxrandr' 'kwayland')
makedepends=('extra-cmake-modules')
conflicts=('libkscreen-frameworks')
replaces=('libkscreen-frameworks')
provides=('libkscreen-frameworks')
groups=(plasma)
source=("http://download.kde.org/stable/plasma/${pkgver}/libkscreen-$pkgver.tar.xz"{,.sig})
sha256sums=('a962ee148e811c1be125ad8dd27db99abd9bac4e0feb57ede13ff0151d6bf82f'
            'SKIP')
validpgpkeys=('2D1D5B0588357787DE9EE225EC94D18F7F05997E'  # Jonathan Riddell
              '348C8651206633FD983A8FC4DEACEA00075E1D76'  # KDE Neon
              'D07BD8662C56CB291B316EB2F5675605C74E02CF') # David Edmundson

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../libkscreen-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
