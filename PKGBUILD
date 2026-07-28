# Maintainer:  3mb3dw0rk5 <3mb3dw0rk5 at gmail dot com>
# Contributor: rafael silva <perigoso at riseup dot net>, bs mt <bsmt at bsmt dot me>

pkgname=socketcand-git
pkgver=0.6.1.r103.g6dd5d33
pkgrel=1
pkgdesc="Provide access to CAN interfaces on a machine via a network interface."
arch=('i686' 'x86_64')
url="https://github.com/linux-can/socketcand"
license=('GPL-2.0-only' 'BSD-3-Clause')
makedepends=('git' 'meson' 'libconfig')
source=("git+https://github.com/linux-can/socketcand.git")
md5sums=('SKIP')

pkgver() {
	cd 'socketcand'
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd 'socketcand'
  meson setup -Dlibconfig=true --buildtype=release build
}

build() {
  cd 'socketcand'
  meson compile -C build
}

package() {
  cd 'socketcand'
  DESTDIR="$pkgdir/" meson install -C build
}
