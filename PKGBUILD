# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: BlackIkeEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Valeriy Lyasotskiy <onestep@ukr.net>
# Contributor: Zom <zom@eevul.org>

pkgname=apper
pkgver=1.0.0
pkgrel=1
pkgdesc="An application and package manager using PackageKit"
arch=(x86_64)
url="https://www.kde.org/applications/system/apper/"
license=(GPL)
depends=(packagekit-qt5 kcmutils appstream-qt)
makedepends=(extra-cmake-modules kdoctools plasma-workspace)
optdepends=('plasma-workspace: Updates daemon')
source=("http://download.kde.org/stable/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('1a30be92aab8bd258c2a8824f533c5646b934e06b4268edbd11724ea450f4923'
            'SKIP')
validpgpkeys=(70C26659D184ABC01FFAF45228DDEDC6E4480AD0) # Daniel Nicoletti <dantti12@gmail.com>

prepare() {
  mkdir -p build
}

build() {
  cd build

  cmake ../$pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DAPPSTREAM=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
