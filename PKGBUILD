# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-source-switcher
pkgver=0.4.1
pkgrel=1
pkgdesc="Plugin for OBS Studio to add a source that switches between a list of sources"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/source-switcher.941/"
license=("GPL2")
depends=("obs-studio>=28")
makedepends=("cmake" "git")
source=("$pkgname::git+https://github.com/exeldro/$pkgname#commit=041e8f6549a1eca9468ce4fbb134fbf80bf41844")
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
