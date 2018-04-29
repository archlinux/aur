# Maintainer: lantw44 (at) gmail (dot) com

pkgname=guile-git-lib
_pkgname=guile-git
pkgver=0.0+170+g951a32c
pkgrel=1
pkgdesc='Guile bindings for libgit2'
arch=('x86_64' 'i686')
url="https://gitlab.com/guile-git/guile-git"
license=('GPL3')
depends=('guile' 'guile-bytestructures' 'libgit2')
makedepends=('git')
_commit=951a32c56cc4d80f8836e3c7394783e69c1fcbad
source=("git+https://gitlab.com/${_pkgname}/${_pkgname}.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "0.0+%s+g%s" \
		"$(git rev-list HEAD | wc -l)" \
		"$(git rev-list --max-count=1 HEAD | cut -c 1-7)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	./bootstrap
	./configure --prefix=/usr
	make
}

check() {
	cd "${srcdir}/${_pkgname}"
	make check
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}" install
}
