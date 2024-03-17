# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-recursion-effect
pkgver=0.1.0
pkgrel=2
pkgdesc="Plugin for add recursion effect to a source using a filter"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/recursion-effect.1008/"
license=("GPL-2.0-or-later")
depends=("obs-studio>=28" "glibc")
makedepends=("cmake" "git")
options=('debug')
source=("$pkgname::git+https://github.com/exeldro/$pkgname#commit=61a835ecda4209e8678197b1e9582ede582aa876")
sha256sums=("SKIP")

build() {
  cmake -B build -S $pkgname \
  -DCMAKE_BUILD_TYPE=None \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DLINUX_PORTABLE=OFF \
  -DCMAKE_C_FLAGS="-Wno-error=deprecated-declarations" \
  -Wno-dev

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
