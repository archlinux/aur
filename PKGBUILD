# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-source-switcher
pkgver=0.4.3
pkgrel=1
pkgdesc="Plugin for OBS Studio to add a source that switches between a list of sources"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/source-switcher.941/"
license=("GPL-2.0-or-later")
depends=("obs-studio>=28" "glibc")
makedepends=("cmake" "git")
source=("$pkgname::git+https://github.com/exeldro/$pkgname#commit=b229f40faceb0bb39cea41ce0ce2f2f236c0cbd1")
sha256sums=("SKIP")

build() {
  cmake -B build -S $pkgname \
  -DCMAKE_BUILD_TYPE=None \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DLINUX_PORTABLE=OFF \
  -DQT_VERSION=6 \
  -Wno-dev

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
