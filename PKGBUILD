# Maintainer: lantw44 (at) gmail (dot) com

pkgname=guile-git-lib
_pkgname=guile-git
pkgver=0.4.0
pkgrel=1
pkgdesc='Guile bindings for libgit2'
arch=('x86_64' 'i686' 'armv7h')
url="https://gitlab.com/guile-git/guile-git"
license=('GPL3')
depends=('guile' 'guile-bytestructures' 'libgit2>=0.28.0')
makedepends=('git')
source=(
	"https://gitlab.com/${_pkgname}/${_pkgname}/uploads/2600bb0dfdfb00bfbe46811dccad51d8/${_pkgname}-${pkgver}.tar.gz"
	"https://gitlab.com/guile-git/guile-git/-/raw/v${pkgver}/tests/.ssh/id_rsa_client"
	"https://gitlab.com/guile-git/guile-git/-/raw/v${pkgver}/tests/.ssh/id_rsa_client.pub"
	"https://gitlab.com/guile-git/guile-git/-/raw/v${pkgver}/tests/.ssh/id_rsa_server")
sha256sums=(
	'2ccee3e0520b5db354a1b7070f95e3bbaf0bb0f61c11ca92793728257a7abecf'
	'e58e37ec6d5916b46b785b9db5ae05498e5dc25b1beaa46eee227bf415fee952'
	'8a3b18d1d725f69ab778e0badbc43746766b591a54f965ee2e57d82822775d43'
	'0d49a22bd80c3d1d18061560eecb095c0056ade55fee2fb4c48c290254204641')

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	mkdir tests/.ssh
	cp \
		"${srcdir}/$(basename "${source[1]}")" \
		"${srcdir}/$(basename "${source[2]}")" \
		"${srcdir}/$(basename "${source[3]}")" \
		tests/.ssh
}

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

check() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make check
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
