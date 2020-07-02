_pkgname="gphoto2pp"
pkgname="${_pkgname}-git"
pkgver=34.b66be5c
pkgrel=1
pkgdesc="A C++ wrapper for libgphoto2"
arch=('x86_64')
url="https://github.com/maldworth/gphoto2pp"
license=('LGPL3')
makedepends=('cmake')
depends=('libgphoto2')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
epoch=1
source=("${_pkgname}::git+https://github.com/maldworth/gphoto2pp")

pkgver() {
	cd "${_pkgname}"
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${_pkgname}"
	./cmake_release.sh
}

build() {
	cd "${_pkgname}/build/release"
	make
}

package() {
	cd "${_pkgname}"
	(cd build/release && make PREFIX=/usr DESTDIR="${pkgdir}/" install)
	install -m644 -D "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

sha256sums=('SKIP')
