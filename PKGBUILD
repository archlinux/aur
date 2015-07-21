#Contributor:  Peter Mukhachev <rolling[dot]robot [shift-two] gmail [dot] com>

pkgname=cl-optima-git
_clname=optima   # used in CL scope, not package scope
pkgver=r158.373b245
pkgrel=1
pkgdesc="optima is the recommended pattern-matching library"
arch=('i686' 'x86_64')
url="http://www.cliki.net/optima/"
license=('BSD')
depends=('common-lisp' 'cl-closer-mop')
makedepends=('git')
provides=('cl-optima')
_gitname=("optima")
install=cl-optima-git.install
source=("git+https://github.com/m2ym/optima.git")
md5sums=("SKIP")

pkgver() {
	cd ${_gitname}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
			        }
package() {

	install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}/src
	install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}/lib
	install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}/test
	install -d ${pkgdir}/usr/share/common-lisp/systems

	install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname}/src \
		${srcdir}/${_clname}/src/*.lisp
	install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname}/lib \
		${srcdir}/${_clname}/lib/*.lisp
	install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname}/test \
		${srcdir}/${_clname}/test/*.lisp
	install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} \
		${srcdir}/${_clname}/*.asd

	cd ${pkgdir}/usr/share/common-lisp/systems
	ln -s ../source/${_clname}/${_clname}.asd .

	# TODO: docs (SPEC/README)
}
