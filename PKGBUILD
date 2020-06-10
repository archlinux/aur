# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=wf-config-git 
pkgver=0.4.0.r2.g3554d95
pkgrel=2
pkgdesc="A library for managing configuration files, written for wayfire"
arch=('x86_64')
url="https://github.com/WayfireWM/wf-config"
license=('MIT')
depends=('libevdev' 'libxml2')
makedepends=('git' 'wlroots' 'meson' 'ninja' 'wayland-protocols' 'glm')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
source=('git+https://github.com/WayfireWM/wf-config')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/wf-config"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'

}

build() {
	cd "$srcdir/wf-config/"
  arch-meson build
  ninja -C build
}


package() {
	cd "$srcdir/wf-config"
	DESTDIR="$pkgdir/" ninja -C build install
}
