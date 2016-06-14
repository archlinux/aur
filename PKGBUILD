# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kinit
pkgver=5.23.0
pkgrel=1
pkgdesc='Process launcher to speed up launching KDE applications'
arch=('i686' 'x86_64')
url='https://community.kde.org/Frameworks'
license=('LGPL')
depends=('kio')
makedepends=('extra-cmake-modules' 'kdoctools' 'python')
groups=('kf5')
source=("http://download.kde.org/stable/frameworks/${pkgver%.*}/${pkgname}-${pkgver}.tar.xz")
md5sums=('4072959e05d8a561fca95919fc8fad18')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${pkgname}-${pkgver} \
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
