# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_upstream_name=plasma-simpleMonitor
pkgname=plasma5-applets-simplemonitor
pkgver=0.6
pkgrel=1
pkgdesc="A simple monitor for plasma, completely written in QML and Javascript"
arch=('any')
url="https://store.kde.org/p/1173509/"
license=('GPL')
depends=('plasma-workspace')
optdepends=()
makedepends=('extra-cmake-modules')
source=(https://github.com/dhabyx/${_upstream_name}/archive/v${pkgver}.tar.gz)
sha512sums=('410d8fcb7ef1dbce37b7a039c40bf37397773d5736f4d353570ef4a1433afdefa5e02ac7c30b57f0f6f87c717a94e7e0cbdb5e0cbd3e77b608e24754945cfb68')

build() {
  cd "$srcdir/$_upstream_name-$pkgver"
  mkdir -p build
  cd build
  cmake .. \
        -DCMAKE_INSTALL_PREFIX="`kf5-config --prefix`" \
        -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/$_upstream_name-$pkgver/build"
  make install DESTDIR="${pkgdir}"
}
