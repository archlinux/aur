# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-media-controls
pkgver=0.4.1
pkgrel=1
pkgdesc="Add Media Controls Dock to OBS"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/media-controls.1032/"
license=("GPL-2.0-or-later")
depends=("obs-studio>=28" "gcc-libs" "glibc" "qt6-base")
makedepends=("cmake" "git")
options=('debug')
source=("$pkgname::git+https://github.com/exeldro/$pkgname#commit=2c031f7cbfbd0d2bbc1d07998eef84444efdb2ce")
sha256sums=("SKIP")

build() {
  cmake -B build -S $pkgname \
  -DCMAKE_BUILD_TYPE=None \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DLINUX_PORTABLE=OFF \
  -DQT_VERSION=6 \
  -DCMAKE_CXX_FLAGS="-Wno-error=deprecated-declarations" \
  -Wno-dev

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
