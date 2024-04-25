# Maintainer: Sam Whited <sam@samwhited.com>

_pkgname=libxeddsa
pkgname="${_pkgname}-git"
pkgver=r40.d725c816bb26
pkgrel=3
pkgdesc='A toolkit around Curve25519 and Ed25519 key pairs.'
url="https://github.com/Syndace/${_pkgname}"
license=('MIT')
arch=('x86_64')
makedepends=('git' 'cmake' 'libsodium')
source=("${_pkgname}::git+https://github.com/Syndace/${_pkgname}.git")
sha256sums=('SKIP')
depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
	cd ${_pkgname}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd ${_pkgname}
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
}

build() {
	cd ${_pkgname}
	make
}

package() {
    cd ${_pkgname}
		make DESTDIR="$pkgdir" install
}
