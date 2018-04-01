# Maintainer: Frans-Willem Hardijzer <fw@hardijzer.nl>

pkgname=aqarahub
pkgver=r128.59d206e
pkgrel=1
pkgdesc="AqaraHub: Open-source bridge between Xiaomi Zigbee devices and MQTT"
arch=('x86_64')
url="https://github.com/Frans-Willem/AqaraHub"
license=('GPL3')
makedepends=(cmake git)
depends=(boost)
optdepends=()
conflicts=()

source=( "${pkgname}::git+https://github.com/Frans-Willem/AqaraHub.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${pkgname}"
	git submodule update --init --recursive
}

build() {
	cd "${pkgname}"
	mkdir -p build
	cd build
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib
	make
}

package() {
	cd "${pkgname}/build"
	make DESTDIR="$pkgdir/" install
}

