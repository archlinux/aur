# Maintainer: Francois Menning <f.menning@pm.me>
# Maintainer: katt <magunasu.b97@gmail.com>
# Contributor: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Antonio Rojas
# Contributor: Lev Lybin <lev.lybin@gmail.com>

pkgname=powerdevil-light
pkgver=5.20.5
pkgrel=1
pkgdesc='Manages the power consumption settings of a Plasma Shell. Light version without NetworkManager and Bluez support/dependencies.'
arch=(x86_64)
url='https://www.kde.org/workspaces/plasmadesktop/'
license=(LGPL)
depends=(plasma-workspace)
makedepends=(extra-cmake-modules kdoctools)
groups=(plasma)
conflicts=("${pkgname%-light}")
provides=("${pkgname%-light}")
source=(https://download.kde.org/stable/plasma/"${pkgver}"/"${pkgname%-light}"-"${pkgver}".tar.xz{,.sig})
sha256sums=('32fb5ca72bed38d9bffc47f24a6c4dcee03b1da52b200d0f5bb976f9d48b6ef0'
            'SKIP')
validpgpkeys=('2D1D5B0588357787DE9EE225EC94D18F7F05997E'  # Jonathan Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

build() {
  cmake -B build -S ${pkgname%-light}-${pkgver} \
    -DKF5NetworkManagerQt_FOUND=OFF \
    -DKF5BluezQt_FOUND=OFF \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
