# Maintainer: grufo <madmurphy333 AT gmail DOT com>

_mainapp='gnunet'
_extname='secushare'
_appname="${_mainapp}-${_extname}"
pkgname="${_appname}-git"
pkgver='r5.245de27'
pkgrel=1
pkgdesc="Experimental code for SecuShare (PSYC on top of GNUnet's cryptographic routing)"
arch=('any')
url="https://secushare.org"
license=('GPL')
provides=("${_appname}")
conflicts=("${_appname}")
depends=("${_mainapp}")

source=("git+https://gnunet.org/git/${_appname}.git")

md5sums=('SKIP')

pkgver() {

	cd "${_appname}"
	printf "'r%s.%s'" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {

	cd "${srcdir}/${_appname}"
	./bootstrap
	./configure --prefix=/usr
	make

}

package() {

	cd "${srcdir}/${_appname}"
	make DESTDIR="${pkgdir}" install

}

