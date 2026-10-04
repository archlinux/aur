# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-downstream-keyer
pkgver=0.4.4
pkgrel=1
pkgdesc="Add a Downstream Keyer dock to OBS studio"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/downstream-keyer.1254/"
license=("GPL-2.0-or-later")
depends=("obs-studio>=30" "gcc-libs" "glibc" "qt6-base")
makedepends=("cmake" "git" "vulkan-headers")
source=("$pkgname::git+https://github.com/exeldro/$pkgname#commit=503b243f164df1ce6a9543f8f3cdc16f00afb79e")
sha256sums=("SKIP")

prepare() {
  cd $pkgname

  # Fix Qt GuiPrivate checks
  git cherry-pick -n 183dd51dff410d3b90f3aecd457c3ea3a6d86b11
}

build() {
  cmake -B build -S $pkgname \
  -DCMAKE_BUILD_TYPE=None \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DCMAKE_CXX_FLAGS="-Wno-error=deprecated-declarations" \
  -Wno-dev

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
