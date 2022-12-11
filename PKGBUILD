# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-transition-table
pkgver=0.2.6
pkgrel=1
pkgdesc="Plugin for OBS Studio to add a Transition Table to the tools menu"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/transition-table.1174/"
license=("GPL2")
depends=("obs-studio>=28")
makedepends=("cmake" "git")
source=("$pkgname::git+https://github.com/exeldro/$pkgname#commit=b829abf127ce0f1544cde99f0244a10483c7bbf2")
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
