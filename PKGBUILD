# Maintainer: utsi <youremail@domain.com
_pkgname=evdevhook
pkgname=${_pkgname}-git
pkgdesc="DSU server for motion from evdev compatible joysticks"
pkgrel=1
pkgver=1
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/v1993/evdevhook.git"
license=('GPL3')
depends=('zlib' 'libevdev' 'glibmm')
makedepends=('cmake' 'nlohmann-json')
provides=(evdevhook)
source=("${_pkgname}::git+${url}")
md5sums=('SKIP')

build() {
    cmake -B build -S "${_pkgname}" \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr'
    make -j -C build
}

package() {
	cd build
	make DESTDIR="$pkgdir/" install
	cd "$srcdir/$_pkgname"
	install -Dm644 "config_templates"/* -t "${pkgdir}/usr/share/doc/${_pkgname}"
}


