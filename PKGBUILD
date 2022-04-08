# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-main-view-source
pkgver=0.1.6
pkgrel=1
pkgdesc="This is a simple plugin for OBS Studio that provides a source to duplicate the main view"
arch=("i686" "x86_64" "aarch64")
url="https://obsproject.com/forum/resources/main-view-source.1501/"
license=("GPL2")
depends=("obs-studio")
makedepends=("cmake")
options=('debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/norihiro/$pkgname/archive/$pkgver.tar.gz")
sha256sums=("7c4239579e0a87ccd35031b2ae5acf66b1eaa8e390fc5e9d2c4ca254408e0a39")

prepare() {
  cd "$pkgname-$pkgver"
  sed -i 's;${CMAKE_INSTALL_FULL_LIBDIR};/usr/lib;' CMakeLists.txt
}

build() {
  cd "$pkgname-$pkgver"
  cmake -B build \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_INSTALL_PREFIX='/usr'
  make -C build
}

package() {
  cd "$pkgname-$pkgver"
  make -C build DESTDIR="$pkgdir/" install
}
