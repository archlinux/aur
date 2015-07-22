#Contributor:  Peter Mukhachev <rolling[dot]robot [shift-two] gmail [dot] com>

pkgname=cl-lambda-reader-git
_clname=lambda-reader
_reldate=20140815
pkgver=r14.89366cf
pkgrel=1
pkgdesc="Compatibility layer library for gray streams in Common Lisp"
arch=('i686' 'x86_64')
url=("git://github.com/trivial-gray-streams/trivial-gray-streams")
license=('MIT')
depends=('common-lisp' 'cl-named-readtables')
provides=('cl-lambda-reader')
makedepends=('git')
install=${pkgname}.install
_gitname=("lambda-reader")
source=('git+https://gitlab.common-lisp.net/frideau/lambda-reader.git')
md5sums=('SKIP')
pkgver() {
	  cd ${_gitname}
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    }
package() {

	cd "${_gitname}"
	install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}
	install -d ${pkgdir}/usr/share/common-lisp/systems
	install -d ${pkgdir}/usr/share/licenses/${pkgname}

	install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} \
		${srcdir}/${_clname}/*.lisp
	install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} \
		${srcdir}/${_clname}/*.asd

	cd ${pkgdir}/usr/share/common-lisp/systems
	ln -s ../source/${_clname}/${_clname}.asd .
}
