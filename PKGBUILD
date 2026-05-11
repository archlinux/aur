# Maintainer: Jimmy Källhagen
# Mail: TheEnchantedPotato@proton.me

pkgname=hyprpicker-frozen
pkgver=0.4.4.r0.gfd77aea
pkgrel=1
conflicts=('hyprpicker-git' 'hyprpicker')
provides=('hyprpicker-frozen')
pkgdesc="A wlroots-compatible Wayland color picker that does not suck - Frozen For Yggdrasil, Nordix Desktop Environment (do not send bug reports to hyprwm)"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/TheEnchantedPotato/mirror-hyprpicker-hyprland-v0.54.git"
license=('BSD-3-Clause')

depends=(
  cairo
  gcc-libs
  glibc
  libxkbcommon
  wayland
)

makedepends=(
	cmake
	git
	hyprutils-frozen
	hyprwayland-scanner-frozen
	libgl
	libjpeg-turbo
	meson
	ninja
	pango
	wayland-protocols
	xorgproto
)

optdepends=(
  'wl-clipboard: --autocopy'
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