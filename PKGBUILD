# Maintaier: Andreas Baumann <mail at andreas baumann dot cc>
# Contributor: Robin Broda <robin at broda dot me>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

_commit='d021b907517d0be30bd709dc9649bc9b54e4b4f4'

pkgname=modest
pkgver=0.0.6.${_commit:0:7}
pkgrel=4
pkgdesc='Fast HTML renderer implemented as a pure C99 library with no outside dependencies'
arch=('x86_64')
url='https://github.com/lexborisov/modest'
license=('LGPL2.1')
makedepends=('git')
source=("git+${url}#commit=${_commit}")
md5sums=('7207566f575a7ba84c946f92dfde384c')
provides=('mycore' 'mycss' 'myencoding' 'myfont' 'myhtml' 'myunicode' 'myurl')

build() {
	cd "${pkgname}"

	make CFLAGS="$CFLAGS -Wno-variadic-macros -ffat-lto-objects" prefix="/usr"
}

check() {
	cd "${pkgname}"

	make test
}

package() {
	cd "${pkgname}"

	make DESTDIR="${pkgdir}/" prefix="/usr" install
}
