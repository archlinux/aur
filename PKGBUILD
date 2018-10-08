# $Id$
# Maintainer: Joey Pabalinas <alyptik@protonmail.com>

pkgname=cepl-git
_pkgname=${pkgname%-*}
pkgver=6.2.0.r6.gc6d6939c8b5dbcf36b
pkgrel=1
pkgdesc='An interactive C (ISO/IEC 9899:2011) read–eval–print loop (REPL) currently supporting multiple compilers, shell-esque readline key-bindings/tab-completion, variable tracking, and incremental undo.'
url='https://github.com/alyptik/cepl'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gcc' 'readline' 'libelf')
source=("${_pkgname}::git+https://github.com/alyptik/cepl.git")
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
	mkdir -p "${pkgdir}/usr/share/zsh/site-functions"
	mkdir -p "${pkgdir}/usr/share/man/man1"
	install -Dm644 _cepl "${pkgdir}/usr/share/zsh/site-functions/_cepl"
	make PREFIX="${pkgdir}/usr" install
}
