# Maintainer: grufo <madmurphy333 AT gmail DOT com>

_framework='taler'
_module='exchange'
_appname="${_framework}-${_module}"

pkgname="${_appname}-git"
pkgver='r5634.8ecbdeb5'
pkgrel=1
pkgdesc='Exchange implementation'
arch=('i686' 'x86_64')
url="https://${_framework}.net/"
license=('AGPL')
groups=("${_framework}")
conflicts=("${_appname}" "${_appname}-bin")
provides=("${_appname}")
depends=('python' 'gnunet' 'libmicrohttpd' 'postgresql')
makedepends=('python-jinja')
#checkdepends=('wget')
source=("git+https://git.${_framework}.net/${_module}.git/")
sha256sums=('SKIP')

pkgver() {
	cd "${_module}"
	printf "'r%s.%s'" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${_module}"
	./bootstrap
}

build() {
	cd "${srcdir}/${_module}"
	./configure --prefix=/usr
	make
}

#check() {
#	cd "${srcdir}/${_module}"
#	make check
#}

package() {
	cd "${srcdir}/${_module}"
	make DESTDIR="${pkgdir}" install
}

