# Maintainer: ObscureScience <curvedreality at gmail dot com>

pkgname=urweb-git
_pkgname=urweb
pkgver=20160330.1278321
pkgrel=1
pkgdesc='Full stack web framework based on a functional programming language'
url='http://www.impredicative.com/ur/'
arch=('i686' 'x86_64')
license=('BSD')
depends=()
optdepends=('postgresql' 'mariadb' 'sqlite')
makedepends=('mlton' 'openssl' 'git')
source=('git://github.com/urweb/urweb.git')
md5sums=('SKIP')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	./autogen.sh
	./configure --without-emacs --prefix=/usr
}

build() {
	cd "${srcdir}/${_pkgname}"
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README"
}
