#Contributor:  Peter Mukhachev <rolling[dot]robot [shift-two] gmail [dot] com>

pkgname=cl-trivial-gray-streams-git
_clname=trivial-gray-streams   # used in CL scope, not package scope
_reldate=20140815
pkgver=r57.0483ade
pkgrel=1
pkgdesc="Compatibility layer library for gray streams in Common Lisp"
arch=('i686' 'x86_64')
url=("git://github.com/trivial-gray-streams/trivial-gray-streams")
license=('BSD')
depends=('common-lisp')
provides=('cl-trivial-gray-streams')
makedepends=('git')
install=cl-trivial-gray-streams.install
_gitname=("trivial-gray-streams")
source=('git+https://github.com/trivial-gray-streams/trivial-gray-streams.git')
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

	install -m 644 -t ${pkgdir}/usr/share/licenses/${pkgname} \
		${srcdir}/${_clname}/COPYING

	cd ${pkgdir}/usr/share/common-lisp/systems
	ln -s ../source/${_clname}/${_clname}.asd .
}
