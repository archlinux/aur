# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-dynamic-delay
pkgver=0.1.4
pkgrel=1
pkgdesc="Filter for dynamic delaying a video source"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/dynamic-delay.1035/"
license=("GPL2")
depends=("obs-studio>=28")
makedepends=("cmake" "git")
source=("$pkgname::git+https://github.com/exeldro/$pkgname#commit=c6d4fbb7b7f30fb37c1e19738b37d4615df3f77a")
sha256sums=("SKIP")

build() {
  cd "$pkgname"
  cmake -B build \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DLINUX_PORTABLE=OFF \
  -DQT_VERSION=6

  make -C build
}

package() {
  cd "$pkgname"
  make -C build DESTDIR="$pkgdir/" install
}
