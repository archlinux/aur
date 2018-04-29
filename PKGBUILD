# Maintainer: lantw44 (at) gmail (dot) com

pkgname=guile-bytestructures
_pkgname=scheme-bytestructures
pkgver=0.0+250+g7ed31b1
pkgrel=1
pkgdesc='Structured access library to bytevector contents for Guile'
arch=('x86_64' 'i686')
url="https://github.com/TaylanUB/scheme-bytestructures"
license=('GPL3')
depends=('guile')
makedepends=('git')
_commit=7ed31b1e93a4bf8960f1d4aedbea84f4f594af6d
source=("git+https://github.com/TaylanUB/${_pkgname}#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "0.0+%s+g%s" \
		"$(git rev-list HEAD | wc -l)" \
		"$(git rev-list --max-count=1 HEAD | cut -c 1-7)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	autoreconf -fi
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}" install
}
