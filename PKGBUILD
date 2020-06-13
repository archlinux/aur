# Maintainer: lantw44 (at) gmail (dot) com

pkgname=guile-git-lib
_pkgname=guile-git
pkgver=0.3.0
pkgrel=1
pkgdesc='Guile bindings for libgit2'
arch=('x86_64' 'i686' 'armv7h')
url="https://gitlab.com/guile-git/guile-git"
license=('GPL3')
depends=('guile' 'guile-bytestructures' 'libgit2')
makedepends=('git')
source=(
	"https://gitlab.com/${_pkgname}/${_pkgname}/uploads/4c563d8e7e1ff84396abe8ca7011bcaf/${_pkgname}-${pkgver}.tar.gz"
	"https://gitlab.com/guile-git/guile-git/-/raw/v${pkgver}/tests/.ssh/id_rsa_client"
	"https://gitlab.com/guile-git/guile-git/-/raw/v${pkgver}/tests/.ssh/id_rsa_client.pub"
	"https://gitlab.com/guile-git/guile-git/-/raw/v${pkgver}/tests/.ssh/id_rsa_server")
sha256sums=(
	'75ce437da024fa57d6a2a48ae4e05d48cb42d84f73a3d372baef5c68421bb130'
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
