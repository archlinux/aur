# Maintainer: Marcel Robitaille mail@marcelrobitaille.me
pkgname=gllock-crt-git
pkgver=r64.c77658b
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
md5sums=('SKIP' 'f06f5d3badfd75859957e473f5197fd6')

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${pkgname}"
	patch --forward --strip=1 --input="${srcdir}/config.mk.patch"
}

build() {
	cd "${srcdir}/${pkgname}"
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	export DESTDIR="${pkgdir}"
	make install
}
