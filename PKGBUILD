# Maintainer: Jimmy Källhagen
# Mail: TheEnchantedPotato@proton.me

pkgname=hyprland-qt-support-frozen
pkgver=0.1.0.r8.g073c52b
pkgrel=1
conflicts=('hyprland-qt-support-git' 'hyprland-qt-support-frozen')
provides=('hyprland-qt-support')
pkgdesc="A qml style provider for hypr* qt apps - Frozen For Yggdrasil, Nordix Desktop Environment (do not send bug reports to hyprwm)"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/TheEnchantedPotato/mirror-hyprland-qt-support-hyprland-v0.54.git"
license=('BSD-3-Clause')

depends=(
  'qt6-wayland>=6.6.0'
  'hyprlang-frozen'
)
makedepends=(
  cmake
  git
  ninja
)

pkgsrc=$pkgname
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
	-D INSTALL_QML_PREFIX=/lib/qt6/qml
	-D CMAKE_INSTALL_LIBDIR=/usr/lib
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
