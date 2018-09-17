#Maintainer: Iru Cai <mytbk920423@gmail.com>

pkgname='libotr-ng-git'
_pkgname='libotr-ng'
pkgver=2270.2d718c6
pkgrel=1
pkgdesc='A new implementation of OTR with support for version 4.'
arch=('i686' 'x86_64')
url='https://github.com/otrv4/libotr-ng'
license=('LGPL')
depends=('glib2' 'libgoldilocks-git' 'libsodium' 'libotr' 'libgcrypt')
source=('git+https://github.com/otrv4/libotr-ng.git')
sha256sums=('SKIP')

build() {
	cd "${srcdir}/${_pkgname}"

	sed -i '/-Wnull-dereference/d' configure.ac
	autoreconf --install
	./configure --prefix=/usr --enable-debug=no
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
