#Contributor:  Peter Mukhachev <rolling[dot]robot [shift-two] gmail [dot] com>

pkgname=cl-named-readtables-git
_clname=named-readtables  # used in CL scope, not package scope
_reldate=20140815
pkgver=r69.ee15fc6
pkgrel=1
pkgdesc="Named-Readtables is a library that provides a namespace for
readtables akin to the already-existing namespace of packages."
arch=('i686' 'x86_64')
url=("git://github.com/trivial-gray-streams/trivial-gray-streams")
license=('BSD')
depends=('common-lisp')
provides=('cl-named-readtables')
makedepends=('git')
install=${pkgname}.install
_gitname=("named-readtables")
source=('git+https://github.com/melisgl/named-readtables.git')
md5sums=('SKIP')
pkgver() {
	  cd ${_gitname}
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    }
package() {

	cd "${_gitname}"
	install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}/src
	install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}/test
	install -d ${pkgdir}/usr/share/common-lisp/systems
	install -d ${pkgdir}/usr/share/licenses/${pkgname}

	install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname}/src \
		${srcdir}/${_clname}/src/*.lisp
	install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname}/test \
		${srcdir}/${_clname}/test/*.lisp
	install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} \
		${srcdir}/${_clname}/*.asd
	install -m 644 -t ${pkgdir}/usr/share/licenses/${pkgname} \
		${srcdir}/${_clname}/LICENSE

	cd ${pkgdir}/usr/share/common-lisp/systems
	ln -s ../source/${_clname}/${_clname}.asd .
}
