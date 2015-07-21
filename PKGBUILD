#Contributor:  Peter Mukhachev <rolling[dot]robot [shift-two] gmail [dot] com>

pkgname=cl-closer-mop-git
_clname=closer-mop  # used in CL scope, not package scope
_reldate=20140815
pkgver=r249.f0ee095
pkgrel=1
pkgdesc="A compatibility layer that rectifies many of the absent or incorrect MOP features as detected by MOP Feature Tests."
arch=('i686' 'x86_64')
url=("git://github.com/trivial-gray-streams/trivial-gray-streams")
license=('BSD')
depends=('common-lisp')
provides=('cl-closer-mop')
makedepends=('git')
install=cl-closer-mop-git.install
_gitname=("closer-mop")
source=('git+https://github.com/mcna/closer-mop.git')
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
