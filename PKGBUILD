#Contributor:  Peter Mukhachev <rolling[dot]robot [shift-two] gmail [dot] com>

pkgname=cl-trivial-features
_clname=trivial-features   # used in CL scope, not package scope
pkgver=0.8
pkgrel=1
pkgdesc="ensures consistent *FEATURES* across multiple Common Lisp implementations"
arch=('i686' 'x86_64')
url="http://www.cliki.net/trivial-features/"
license=('BSD')

# TODO: replace this segment with 'common-lisp' when all provide it.
if pacman -Qq clisp-new-clx &>/dev/null; then
    depends=('clisp-new-clx' 'cl-asdf')
elif pacman -Qq clisp-gtk2 &>/dev/null; then
    depends=('clisp-gtk2' 'cl-asdf')
elif pacman -Qq sbcl &>/dev/null; then
    depends=('sbcl')
elif pacman -Qq clisp &>/dev/null; then
    depends=('clisp' 'cl-asdf')
elif pacman -Qq cmucl &>/dev/null; then
    depends=('cmucl' 'cl-asdf')
else
    depends=('sbcl')
fi

install=cl-trivial-features.install
source=("http://common-lisp.net/~loliveira/tarballs/${_clname}/${_clname}_${pkgver}.tar.gz")
md5sums=('48f27718475f16a0c3e6d0714f6f5a6e')
options=(docs)


package() {

	install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}/src
	install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}/tests
	install -d ${pkgdir}/usr/share/common-lisp/systems
	install -d ${pkgdir}/usr/share/licenses/${pkgname}

	install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname}/src \
		${srcdir}/${_clname}_${pkgver}/src/*.lisp
	install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname}/tests \
		${srcdir}/${_clname}_${pkgver}/tests/*.lisp
	install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} \
		${srcdir}/${_clname}_${pkgver}/*.asd

	install -m 644 -t ${pkgdir}/usr/share/licenses/${pkgname} \
		${srcdir}/${_clname}_${pkgver}/COPYRIGHT

	cd ${pkgdir}/usr/share/common-lisp/systems
	ln -s ../source/${_clname}/${_clname}.asd .
	ln -s ../source/${_clname}/${_clname}-tests.asd .

	# TODO: docs (SPEC/README)
}
