# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-frame-interleave-filter
pkgver=0.1.0
pkgrel=1
pkgdesc="This plugin interleaves video frames to reduce CPU and GPU usage while the source is not displayed to the program"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/obs-frame-interleave-filter.1618/"
license=("GPL2")
depends=("obs-studio>=28")
makedepends=("cmake")
options=('debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/norihiro/$pkgname/archive/$pkgver.tar.gz")
sha256sums=("2c5ac80bcaef28f9a5f2a266ffe9eb768e7e5538b6f5a8b0c92de4d7c7f44ea8")

build() {
  cd "$pkgname-$pkgver"
  cmake -B build \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DLINUX_PORTABLE=OFF \
  -DQT_VERSION=6

  make -C build
}

package() {
  cd "$pkgname-$pkgver"
  make -C build DESTDIR="$pkgdir/" install
}
