#Maintainer: Iru Cai <mytbk920423@gmail.com>

pkgname='pidgin-otrng-git'
_pkgname='pidgin-otrng'
pkgver=694.232fc65
pkgrel=1
pkgdesc='a pidgin plugin which implements Off-the-Record (OTRv4) Messaging'
arch=('i686' 'x86_64')
url='https://github.com/otrv4/pidgin-otrng'
license=('GPL2')
depends=('pidgin' 'libotr-ng-git' 'perl-xml-parser')
makedepends=('intltool')
source=('git+https://github.com/otrv4/pidgin-otrng.git')
sha256sums=('SKIP')

build() {
	cd "${srcdir}/${_pkgname}"

	intltoolize --force --copy
	autoreconf -s -i
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
