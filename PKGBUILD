# Maintainer: Jimmy Källhagen
# Mail: TheEnchantedPotato@proton.me

pkgname=hyprwire-frozen
pkgver=0.3.0.r16.g62cd80b
pkgrel=1
conflicts=('hyprwire' 'hyprwire-git')
provides=('hyprwire-frozen' 'hyprwire')
pkgdesc="A fast and consistent wire protocol for IPC - Frozen For Yggdrasil, Nordix Desktop Environment (do not send bug reports to hyprwm)"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/TheEnchantedPotato/mirror-hyprwire-hyprland-v0.54.git"
license=('BSD-3-Clause')

depends=(
  hyprutils-frozen
  pugixml
  libffi
)
makedepends=(
  cmake
  git
  gtest
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
