# Maintainer: tippfehlr <tippfehlr@tippfehlr.eu>
# Contributor: Vítor Vasconcellos <vitor.vasconcellos at proton dot me>

pkgname=tail-tray
pkgver=0.2.23
pkgrel=2
pkgdesc='Tailscale tray menu and UI for the KDE Plasma Desktop'
arch=('x86_64' 'aarch64')
url='https://github.com/SneWs/tail-tray'
license=('GPL-3.0-or-later')
depends=('tailscale' 'qt6-base' 'hicolor-icon-theme')
optdepends=('davfs2')
makedepends=('cmake' 'extra-cmake-modules' 'qt6-tools' 'git')
source=("git+https://github.com/SneWs/tail-tray#tag=v$pkgver")
sha512sums=('a143d1efd6d5ca7ca97fb21b689f5062a211875298f1ac04266c38ee35b806350403a6677007b5098eadffdb4adb118d66d710879897a0b08bb48cc3460d0707')
options=('strip')

build() {
  local cmake_options=(
    -B build
    -S $pkgname
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
	-D CMAKE_INSTALL_LIBDIR=/lib
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
