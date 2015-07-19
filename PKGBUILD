# Maintainer:  mrshpot <mrshpot at gmail dot com>
#Contributor:  Peter Mukhachev <rolling[dot]robot [shift-two] gmail [dot] com>

# 'alexandria' is taken by another app
pkgname=cl-alexandria-git
pkgver=r194.b1c6ee0
pkgrel=1
pkgdesc="Common Lisp portability library"
arch=('i686' 'x86_64')
url="http://common-lisp.net/project/alexandria/"
license=('custom') # Public Domain
provides=('cl-alexandria')
conflicts=('cl-alexandria-darcs')
depends=('common-lisp')
makedepends=('git')
install=cl-alexandria.install
source=("git+https://github.com/keithj/alexandria.git")
md5sums=("SKIP")
options=(docs)

_clname=alexandria

_gitname="alexandria"

pkgver() {
	cd ${_gitname}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	}

package() {

    cat << EOM

	WARNING!

	You are about to build a pre-release package using a snapshot from a
	repository. The resulting package may be unusable or pose a security
	risk, since the install script does not check source file hashes. Do
	not continue if this is undesirable.

EOM

	install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}
	install -d ${pkgdir}/usr/share/common-lisp/systems
	install -d ${pkgdir}/usr/share/licenses/${_clname}

	install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} \
		${srcdir}/${_clname}/*.lisp
	install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} \
		${srcdir}/${_clname}/*.asd
	install -m 644 -t ${pkgdir}/usr/share/licenses/${_clname} \
		${srcdir}/${_clname}/LICENCE

	cd ${pkgdir}/usr/share/common-lisp/systems
	ln -s ../source/${_clname}/alexandria.asd .
	ln -s ../source/${_clname}/alexandria-tests.asd .
}
