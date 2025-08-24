# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-source-copy
pkgver=0.3.0
pkgrel=1
pkgdesc="Copy and paste scenes, sources and filters on clipboard"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/source-copy.1261/"
license=(GPL-2.0-or-later)
depends=("obs-studio>=28" "glibc" "gcc-libs" "qt6-base")
makedepends=("cmake" "git")
source=("$pkgname::git+https://github.com/exeldro/$pkgname#commit=b7d5bac3572800011a3ec7f33955a35c06f748ca")
sha256sums=("SKIP")

build() {
  cmake -B build -S "$pkgname" \
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
