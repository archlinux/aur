# Maintainer: tippfehlr <tippfehlr@tippfehlr.eu>
# Contributor: Vítor Vasconcellos <vitor.vasconcellos at proton dot me>

pkgname=tail-tray
pkgver=0.2.22
pkgrel=1
pkgdesc='Tailscale tray menu and UI for the KDE Plasma Desktop'
arch=('x86_64' 'aarch64')
url='https://github.com/SneWs/tail-tray'
license=('GPL-3.0-or-later')
depends=('tailscale' 'qt6-base' 'davfs2' 'hicolor-icon-theme')
makedepends=('cmake' 'extra-cmake-modules' 'qt6-tools' 'git')
source=("git+https://github.com/SneWs/tail-tray#tag=v$pkgver")
sha512sums=('b17b1da83992a712aaf4458a119e36f42c5a813c57465be5ffb046f4032f2337075d197d33334562016d2b35b9340984e877959f66f888388457270820ca3b0c')
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
