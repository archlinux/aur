# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-downstream-keyer
pkgver=0.2.5
pkgrel=2
pkgdesc="Add a Downstream Keyer dock to OBS studio"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/downstream-keyer.1254/"
license=("GPL2")
depends=("obs-studio>=28")
makedepends=("cmake" "git")
source=("$pkgname::git+https://github.com/exeldro/$pkgname#tag=$pkgver")
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