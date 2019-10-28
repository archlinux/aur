pkgname=wayfire-plugins-extra-git
pkgver=r8.5c9aa89
pkgrel=2
pkgdesc="3D wayland compositor extra plugins"
arch=('any')
url="https://github.com/WayfireWM/wayfire-plugins-extra"
license=('MIT')
depends=('wayfire' 'glibmm' 'wlroots' 'wf-config' 'wayland-protocols' 'boost' 'gtkmm3' 'libxkbcommon' 'iio-sensor-proxy')
makedepends=('git' 'meson' 'ninja' 'wayland-protocols' 'extra-cmake-modules')
optdepends=('wcm: GTK3-based configuration tool for the Wayfire compositor')
provides=("${pkgname}" "wayfire-plugins-extra")
conflicts=("wayfire-plugins-extra")
replaces=()
options=()
source=('git+https://github.com/WayfireWM/wayfire-plugins-extra')
sha256sums=('SKIP')
install=wayfire-plugins-extra.install
prepare() {
  cd "$srcdir/wayfire-plugins-extra"
  git submodule update --init --recursive
}
pkgver() {
	cd "$srcdir/wayfire-plugins-extra"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {
	cd "$srcdir/wayfire-plugins-extra/"
  rm -rf build
  arch-meson build
  ninja -C build
}


package() {
	cd "$srcdir/wayfire-plugins-extra"
	DESTDIR="$pkgdir/" ninja -C build install
}
