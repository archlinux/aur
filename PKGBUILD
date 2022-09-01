# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-scene-collection-manager
pkgver=0.0.8
pkgrel=1
pkgdesc="Plugin for OBS Studio to add a Scene Collection Manager"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/scene-collection-manager.1434/"
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
