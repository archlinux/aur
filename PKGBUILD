#Maintainer:   Aman Grewal <agrewal at protonmail dot com>
#Contributor:  Peter Mukhachev <rolling[dot]robot [shift-two] gmail [dot] com>

pkgname=cl-named-readtables-git
_clname=named-readtables  # used in CL scope, not package scope
pkgver=0.9.r20.g985b162
pkgrel=1
pkgdesc="A library that provides a namespace for
readtables akin to the already-existing namespace of packages."
arch=('any')
url="https://github.com/melisgl/named-readtables"
license=('BSD')
depends=('common-lisp')
provides=('cl-named-readtables')
makedepends=('git')
source=('git+https://github.com/melisgl/named-readtables.git')
md5sums=('SKIP')

pkgver() {
	  cd $_clname
	  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {

	install -Dm644 "$srcdir"/$_clname/LICENSE \
		"$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	install -d "$pkgdir"/usr/share/common-lisp/source/$_clname/src
	install -d "$pkgdir"/usr/share/common-lisp/source/$_clname/test
	install -d "$pkgdir"/usr/share/common-lisp/systems

	install -m 644 -t "$pkgdir"/usr/share/common-lisp/source/$_clname/src \
		"$srcdir"/$_clname/src/*.lisp
	install -m 644 -t "$pkgdir"/usr/share/common-lisp/source/$_clname/test \
		"$srcdir"/$_clname/test/*.lisp
	install -m 644 -t "$pkgdir"/usr/share/common-lisp/source/$_clname \
		"$srcdir"/$_clname/$_clname.asd

	cd "$pkgdir"/usr/share/common-lisp/systems
	ln -s ../source/$_clname/$_clname.asd .
}
