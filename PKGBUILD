# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=wf-config-git
pkgver=0.7.1.r0.g62e3897
pkgrel=1
pkgdesc="A library for managing configuration files, written for wayfire"
arch=('x86_64')
url="https://github.com/WayfireWM/wf-config"
license=('MIT')
depends=('libevdev' 'libxml2')
makedepends=('git' 'wlroots' 'meson' 'ninja' 'wayland-protocols' 
	          'glm' 'doctest' 'cmake')
provides=("wf-config=0.4.0")
conflicts=("${pkgname%-git}")
replaces=()
source=('git+https://github.com/WayfireWM/wf-config')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/wf-config"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'

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
