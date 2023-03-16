# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-3d-effect
pkgver=0.0.1
pkgrel=1
pkgdesc="Plugin for OBS Studio adding 3D effect filter"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/3d-effect.1692/"
license=("GPL2")
depends=("obs-studio>=28")
makedepends=("cmake" "git")
source=("$pkgname::git+https://github.com/exeldro/$pkgname#commit=92d42e25378a8ab108a312609d2a9f38e6d186c4")
sha256sums=("SKIP")

build() {
  cd "$pkgname"
  cmake -B build \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DLINUX_PORTABLE=OFF

  make -C build
}

package() {
  cd "$pkgname"
  make -C build DESTDIR="$pkgdir/" install
}
