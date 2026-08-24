# Maintainer: Nico <d3sox at protonmail dot com>

_pkgname=kde-thumbnail-bloom
pkgname=kwin-effects-thumbnail-bloom-git
pkgver=r42.727e5df
pkgrel=1
pkgdesc="KWin effect that turns obscured windows into interactive thumbnails"
arch=(x86_64)
url="https://github.com/LMauricius/kde-thumbnail-bloom"
license=(GPL-2.0-or-later)
depends=(
  gcc-libs
  glibc
  kcmutils
  kcolorscheme
  kconfig
  kconfigwidgets
  kcoreaddons
  ki18n
  kwin
  libepoxy
  qt6-base
)
makedepends=(
  cmake
  extra-cmake-modules
  git
)
provides=(kwin-effects-thumbnail-bloom)
conflicts=(kwin-effects-thumbnail-bloom)
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake \
    -B build \
    -S "$_pkgname" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
