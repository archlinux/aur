# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_upstream_name=plasma-applet-resources-monitor
pkgname=plasma5-applets-resources-monitor
pkgver=1.0.6
pkgrel=1
pkgdesc="Plasma 5 applet for monitoring CPU and RAM"
arch=('any')
url="https://store.kde.org/p/998908/"
license=('GPL')
depends=('plasma-workspace')
optdepends=()
makedepends=('extra-cmake-modules')
source=(https://github.com/kotelnik/${_upstream_name}/archive/v${pkgver}.tar.gz)
sha256sums=('720498b76f94ce7aac2875c1b39fb864c12ad8548109fa6acf51528ac3cd673c')

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
