# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-main-view-source
pkgver=0.1.7
pkgrel=1
pkgdesc="This is a simple plugin for OBS Studio that provides a source to duplicate the main view"
arch=("i686" "x86_64" "aarch64")
url="https://obsproject.com/forum/resources/main-view-source.1501/"
license=("GPL2")
depends=("obs-studio")
makedepends=("cmake")
options=('debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/norihiro/$pkgname/archive/$pkgver.tar.gz")
sha256sums=("cc714ecba180f78fb88f1ded1271acac1408fe291f3aaf015cdd6166eaed9d69")

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
