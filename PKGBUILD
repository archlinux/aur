pkgname=wf-osk-git
pkgver=r7.d28bd69
pkgrel=1
pkgdesc="A very, very basic on-screen keyboard for wayland using gtkmm, virtual-keyboard-v1 and layer-shell protocols"
arch=('any')
url="https://github.com/WayfireWM/wf-osk"
license=('MIT')
depends=('wayland-protocols' 'gtkmm3' 'gtk-layer-shell')
makedepends=('git' 'meson' 'ninja' 'wayland-protocols' 'extra-cmake-modules')
provides=("${pkgname}" "wf-osk")
conflicts=("wf-osk")
replaces=()
options=()
source=('git+https://github.com/WayfireWM/wf-osk')
sha256sums=('SKIP')
prepare() {
  cd "$srcdir/wf-osk"
  git submodule update --init --recursive
}
pkgver() {
	cd "$srcdir/wf-osk"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {
	cd "$srcdir/wf-osk/"
  rm -rf build
  arch-meson build
  ninja -C build
}


package() {
	cd "$srcdir/wf-osk"
	DESTDIR="$pkgdir/" ninja -C build install
}
