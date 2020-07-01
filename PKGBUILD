# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>
# Maintainer: Francois Menning <f.menning@pm.me>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Antonio Rojas
# Contributor: Lev Lybin <lev.lybin@gmail.com>

_pkgname=powerdevil
pkgname=powerdevil-light
pkgver=5.19.2
pkgrel=1
pkgdesc='Manages the power consumption settings of a Plasma Shell. Light version without NetworkManager and Bluez support/dependencies.'
arch=(x86_64)
url='https://www.kde.org/workspaces/plasmadesktop/'
license=(LGPL)
depends=(plasma-workspace)
makedepends=(extra-cmake-modules kdoctools)
groups=(plasma)
conflicts=(powerdevil)
provides=(powerdevil)
source=("https://download.kde.org/stable/plasma/$pkgver/${_pkgname}-$pkgver.tar.xz"{,.sig})
sha256sums=('63dc88ea66add3eccbde284b5ee8242b9e0b93c04a20b8cbbb63ae5937f4bde1'
            'SKIP')
validpgpkeys=('2D1D5B0588357787DE9EE225EC94D18F7F05997E'  # Jonathan Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

prepare() {
  mkdir -p ${_pkgname}-$pkgver/build
}

build() {
  cd ${_pkgname}-$pkgver/build
  cmake .. \
    -DKF5NetworkManagerQt_FOUND=OFF \
    -DKF5BluezQt_FOUND=OFF \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DCMAKE_VERBOSE_MAKEFILE=OFF \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd ${_pkgname}-$pkgver/build
  make DESTDIR="$pkgdir" install
}
