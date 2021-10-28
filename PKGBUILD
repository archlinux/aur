# Maintainer: Bruno Silva <brunofernandes at ua dot pt>

pkgname=nats-cclient-git
_pkgname=nats.c
pkgver=r736.b74c83f
pkgrel=1
pkgdesc="NATS & NATS Streaming - C Client"
arch=('i686' 'x86_64')
url="https://github.com/nats-io/nats.c"
license=('GPL')
depends=()
makedepends=(glibc cmake git autoconf automake gcc)
optdepends=()
provides=('nats-cclient')
conflicts=('nats-cclient')
replaces=('nats-cclient')
source=(${_pkgname}::git+https://github.com/nats-io/nats.c.git#branch=main)
md5sums=('SKIP')

pkgver() {
	cd ${_pkgname}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	mkdir build && cd build
	cmake -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
				-DNATS_BUILD_TLS_USE_OPENSSL_1_1_API=ON \
        -DCMAKE_BUILD_TYPE=Release ..
	make
}

package() {
	cd "${srcdir}/${_pkgname}/build"



	make DESTDIR="$pkgdir/" install
}
