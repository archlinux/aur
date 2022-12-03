# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-time-warp-scan
pkgver=0.1.7
pkgrel=1
pkgdesc="Time Warp Scan filter for OBS Studio"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/time-warp-scan.1167/"
license=("GPL2")
depends=("obs-studio>=28")
makedepends=("cmake" "git")
source=("$pkgname::git+https://github.com/exeldro/$pkgname#commit=f955f8e3baa362efa88ee9a49e30a80bbd5baa6f")
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
