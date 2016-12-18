# Maintainer: Timothée Ravier <tim@siosm.fr>

pkgname=libbus1-git
_pkgname=${pkgname/-git}
pkgver=r282.717b601
pkgrel=1
pkgdesc="Bus1 IPC Library"
arch=('i686' 'x86_64')
url="https://github.com/bus1/${_pkgname}"
license=('LGPL2.1')
makedepends=('git')
depends=('c-rbtree-git' 'c-variant-git' 'c-sundry-git' 'bus1-git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=("${_pkgname}")
source=("git+https://github.com/bus1/${_pkgname}.git"
        'configure.ac-fix.patch')
sha256sums=('SKIP'
            'd7214407d9385f503f181bf488f3b5e687e81cc7f9d10ff0746599aca5b91cba')
sha384sums=('SKIP'
            'afdcb6f1a7300e80773c11c4e2eb09391ebacaaae90895c5914816b1749c0217cb390c0d61005e93519b476e5715250b')
sha512sums=('SKIP'
            '567dee6f33ecc777743a55c3c87f1f239ca784d2fe53689b537bf79a4b27497f83ff2c09e9d7b633517ae2c03d70287273fd36714f245e8e66bfe325b45d3bc4')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${_pkgname}"
	patch -p1 -i ../configure.ac-fix.patch
}

build() {
	cd "${_pkgname}"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "${_pkgname}"
	make DESTDIR="${pkgdir}" install
}
