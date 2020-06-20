#Maintainer: Iru Cai <mytbk920423@gmail.com>

pkgname='libgoldilocks-git'
_pkgname='libgoldilocks'
pkgver=727.d07cb5b
pkgrel=1
pkgdesc="An implementation of Mike Hamburg's Ed448 (Goldilocks) curve"
arch=('i686' 'x86_64')
url='https://github.com/otrv4/libgoldilocks'
license=('MIT')
depends=()
source=('git+https://github.com/otrv4/libgoldilocks.git'
	'remove_archflags.patch')
sha256sums=('SKIP'
	'0a1e262dd29db8ffc3fe7b41f35b9fc4f0d417d5da83557da7f5aa9ed9c00a04')

prepare() {
	cd "${srcdir}/${_pkgname}"
	patch -p1 -i "${srcdir}/remove_archflags.patch"
}

build() {
	cd "${srcdir}/${_pkgname}"

	autoreconf --install
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}" install
}

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}
