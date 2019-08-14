# Maintainer: Hiral Patel <ahirapatel at gmail dot com>
_bpn=paho-mqtt-cpp
pkgname=${_bpn}-git
pkgver=1.0.1.r47.g7fe0c26
pkgrel=1
pkgdesc="A C++ wrapper around paho-mqtt-c"
arch=('x86_64')
url="https://github.com/eclipse/paho.mqtt.cpp"
license=('EPL')
depends=(paho-mqtt-c gcc-libs openssl)
makedepends=(git cmake)
provides=(${_bpn})
conflicts=(${_bpn})
source=("$_bpn::git+https://github.com/eclipse/paho.mqtt.cpp.git")
md5sums=('SKIP')

pkgver() {
	cd $_bpn
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	mkdir -p build
}

build() {
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib ../$_bpn
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir/" install
}

