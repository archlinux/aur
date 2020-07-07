# Maintainer: Robin Broda <robin at broda dot me>

_commit='d021b907517d0be30bd709dc9649bc9b54e4b4f4'

pkgname=modest
pkgver=0.0.6.${_commit:0:7}
pkgrel=2
pkgdesc='Fast HTML renderer implemented as a pure C99 library with no outside dependencies'
arch=('x86_64')
url='https://github.com/lexborisov/modest'
license=('LGPL2.1')
makedepends=('git')
source=("git+${url}#commit=${_commit}")
md5sums=('SKIP')
provides=('mycore' 'mycss' 'myencoding' 'myfont' 'myhtml' 'myunicode' 'myurl')

build() {
	cd "${pkgname}"

	make CFLAGS="$CFLAGS -Wno-variadic-macros" prefix="/usr"
}

check() {
	cd "${pkgname}"

	make test
}

package() {
	cd "${pkgname}"

	make DESTDIR="${pkgdir}/" prefix="/usr" install
}
