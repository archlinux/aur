# $Id$
# Maintainer: Joey Pabalinas <alyptik@protonmail.com>

pkgname=cepl-git
_pkgname=${pkgname%-*}
pkgver=0.7.1.r0.g03feb70
pkgrel=1
pkgdesc='CEPL is a command-line C11 Read-Eval-Print Loop supporting multiple compilers, readline key-bindings/tab-completion, and the ability to specify additional shared libraries to link against.'
url='https://github.com/alyptik/cepl'
arch=('i686' 'x86_64')
license=('Apache')
depends=('gcc' 'readline')
source=("${_pkgname}::git+http://github.com/alyptik/cepl")
sha256sums=('SKIP')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('zipman')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags  2>/dev/null | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	mkdir -p "${pkgdir}/usr/share/man/man7"
	make PREFIX="${pkgdir}/usr" install
}
