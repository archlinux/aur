# Maintainer: Marcel Robitaille mail@marcelrobitaille.me
pkgname=gllock-crt-git
pkgver=r69.8123a65
pkgrel=1
pkgdesc="not so simple opengl based X display locker utility -- crt shader"
arch=("i686" "x86_64")
url="https://github.com/kuravih/gllock"
license=('MIT')
provides=('gllock')
conflicts=('gllock')
depends=()
makedepends=('git' 'clang' 'gcc' 'make' 'xorgproto' 'glew')
source=('gllock-git::git+https://github.com/kuravih/gllock' 'config.mk.patch')
md5sums=('SKIP' '4c42e503474809bc1dd8d8f2ceae6a10')

pkgver() {
	cd "${srcdir}/gllock-git"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/gllock-git"
	patch --forward --input="${srcdir}/config.mk.patch"
}

build() {
	cd "${srcdir}/gllock-git"
	make
}

package() {
	cd "${srcdir}/gllock-git"
	export DESTDIR="gllock-git"
	make install
}
