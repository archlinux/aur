# Maintainer: spapadim <spapadim at gmail dot com>

_pluginname=obs-soundboard
pkgname=$_pluginname
pkgver=2.0.0
pkgrel=1
pkgdesc="OBS plugin that adds a soundboard dock"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/soundboard-dock.1470/"
license=(GPL-2.0-or-later)
depends=("obs-studio>=28" "glibc" "gcc-libs" "qt6-base")
makedepends=("cmake")
options=('debug')
source=("$_pluginname-$pkgver.tar.gz"::"https://github.com/cg2121/$_pluginname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=(""6d727f3552b3113f91fac66f8c9862c3c43e80a77a45e82bd68abbae76e767d2)

build() {
  cmake -B build -S "$_pluginname-$pkgver" \
  -DCMAKE_BUILD_TYPE=None \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DLINUX_PORTABLE=OFF \
  -DQT_VERSION=6 \
  -DCMAKE_CXX_FLAGS="-Wno-error=deprecated-declarations" \
  -Wno-dev

  cmake --build  build
}

package() {
 DESTDIR="$pkgdir" cmake --install build
}
 
