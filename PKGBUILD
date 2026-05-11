# Maintainer: Jimmy Källhagen
# Mail: TheEnchantedPotato@proton.me

pkgname=hyprgraphics-frozen
pkgver=0.5.0.r3.g13c5366
pkgrel=1
conflicts=('hyprgraphics-git')
provides=('hyprgraphics-frozen' 'hyprgraphics' 'libhyprgraphics.so')
pkgdesc="Hyprland graphics / resource utilities - Frozen For Yggdrasil, Nordix Desktop Environment (do not send bug reports to hyprwm)"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/TheEnchantedPotato/mirror-hyprgraphics-hyprland-v0.54.git"
license=('BSD-3-Clause')

depends=(
  cairo
  file
  hyprutils-frozen
  libgl
  libjpeg
  libjxl
  libpng
  librsvg
  libwebp
  pango
  pixman
)

makedepends=(
  cmake
  git
  ninja
)

_pkgsrc=$pkgname
source=("$_pkgsrc::git+$url")
sha256sums=('SKIP')

build() {
  local cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}


package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}