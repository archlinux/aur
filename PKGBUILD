#Contributor:  Peter Mukhachev <rolling[dot]robot [shift-two] gmail [dot] com>

pkgname=cl-matlisp-git
_clname=matlisp   # used in CL scope, not package scope
pkgver=r955.96cc6aa
pkgrel=1
pkgdesc="BLAS and LAPACK linear algebra library wrapper which makes their features accessible through a set of CLOS classes "
arch=('i686' 'x86_64')
url=("https://github.com/matlisp/matlisp/")
license=('BSD')
depends=('common-lisp' 'cl-cffi' 'cl-iterate' 'cl-optima' 'cl-lambda-reader' 'cl-trivial-garbage')
provides=('matlisp')
makedepends=('git')
_gitname=("matlisp")
source=('git+https://github.com/matlisp/matlisp.git#branch=t2')
install=${pkgname}.install
md5sums=('SKIP')
pkgver() {
	  cd ${_gitname}
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    }
package() {

	install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}/ &&
		cd ${pkgdir}/usr/share/common-lisp/source/${_clname}/

	src_files=$(cd "${srcdir}/${_gitname}"; find "src" -type f)

	for f in $src_files; do
		install -m 644 -D ${srcdir}/${_gitname}/$f \
			${pkgdir}/usr/share/common-lisp/source/${_clname}/$f
	done

	install -d ${pkgdir}/usr/share/common-lisp/systems
	install -d ${pkgdir}/usr/share/licenses/${_clname}
	install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}/tests

	cd ${srcdir}/${_gitname}
	install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname}/tests/ \
		${srcdir}/${_clname}/tests/*
	install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} \
		${srcdir}/${_clname}/*.asd

	install -m 644 -t ${pkgdir}/usr/share/licenses/${_clname} \
		${srcdir}/${_clname}/LICENSE

	cd ${pkgdir}/usr/share/common-lisp/systems
	ln -s ../source/${_clname}/${_clname}.asd .
}

