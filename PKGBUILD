# Maintainer: DavidK <david_king at softhome dot net>
# Contributor:   mrshpot <mrshpot at gmail dot com>
# Contributor:  veox <box 55 [shift-two] mail [dot] ru>
# Contributor:  Peter Mukhachev <rolling[dot]robot [shift-two] gmail [dot] com>

pkgname=cl-cffi
_clname=cffi    # used in CL scope, not package scope
pkgver=0.15.0
pkgrel=1
pkgdesc="Common Foreign Function Interface for Common Lisp"
arch=('any')
url="http://common-lisp.net/project/cffi/"
license=('BSD')
depends=('libffi' 'common-lisp' 'cl-alexandria' 'cl-babel' 'cl-trivial-features')
optdepends=('cl-bordeaux-threads: For the test suite'
            'cl-rt: For the test suite')
install=${pkgname}.install
source=("http://common-lisp.net/project/${_clname}/releases/${_clname}_${pkgver}.tar.gz")
md5sums=('85f79f2b9a0aaa3b77ce6d1671ddf37f')

# If you wish to build the tests in 'tests', on an x86_64, you will
# need gcc-multilib and gcc-libs-multilib for it to compile correctly,
# then uncomment the lines various places below relating to tests.


#build() {
#    cd "${srcdir}"/${_clname}_${pkgver}
#    cd tests
#    make
#}

package() {
    install -d "${pkgdir}"/usr/share/common-lisp/source/${_clname}/examples
    install -d "${pkgdir}"/usr/share/common-lisp/source/${_clname}/grovel
    install -d "${pkgdir}"/usr/share/common-lisp/source/${_clname}/libffi
    install -d "${pkgdir}"/usr/share/common-lisp/source/${_clname}/src
#    install -d "${pkgdir}"/usr/share/common-lisp/source/${_clname}/tests
    install -d "${pkgdir}"/usr/share/common-lisp/source/${_clname}/uffi-compat
    install -d "${pkgdir}"/usr/share/common-lisp/systems
    install -d "${pkgdir}"/usr/share/licenses/${pkgname}

    cd "${srcdir}"/${_clname}_${pkgver}

    install -m 644 -t "${pkgdir}"/usr/share/common-lisp/source/${_clname}/examples \
        "${srcdir}"/${_clname}_${pkgver}/examples/*.lisp
    install -m 644 -t "${pkgdir}"/usr/share/common-lisp/source/${_clname}/grovel \
        "${srcdir}"/${_clname}_${pkgver}/grovel/*
    install -m 644 -t "${pkgdir}"/usr/share/common-lisp/source/${_clname}/libffi \
        "${srcdir}"/${_clname}_${pkgver}/libffi/*.lisp
    install -m 644 -t "${pkgdir}"/usr/share/common-lisp/source/${_clname}/src \
        "${srcdir}"/${_clname}_${pkgver}/src/*.lisp

#    install -m 644 -t "${pkgdir}"/usr/share/common-lisp/source/${_clname}/tests \
#        "${srcdir}"/${_clname}_${pkgver}/tests/*
    install -m 644 -t "${pkgdir}"/usr/share/common-lisp/source/${_clname}/uffi-compat \
        "${srcdir}"/${_clname}_${pkgver}/uffi-compat/*.lisp
    install -m 644 -t "${pkgdir}"/usr/share/common-lisp/source/${_clname} \
        "${srcdir}"/${_clname}_${pkgver}/*.asd
    install -m 644 "${srcdir}"/${_clname}_${pkgver}/COPYRIGHT \
        "${pkgdir}"/usr/share/licenses/${pkgname}

    # The install script must add links to two include files in libffi
    # which are presently not in the usual /usr/include.
    cd "$pkgdir"/usr/share/common-lisp/source/${_clname}
    if [ ! -e /usr/lib/libffi-3.2.1/include/ffi.h ] ; then
      echo "libffi path incorrect"
      exit 1
    fi

    cd "${pkgdir}"/usr/share/common-lisp/systems
    ln -s ../source/${_clname}/${_clname}.asd .
    ln -s ../source/${_clname}/${_clname}-examples.asd .
    ln -s ../source/${_clname}/${_clname}-grovel.asd .
    ln -s ../source/${_clname}/${_clname}-libffi.asd .
#    ln -s ../source/${_clname}/${_clname}-tests.asd .
    ln -s ../source/${_clname}/${_clname}-uffi-compat.asd .
}

# vim:set ts=2 sw=4 et nospell:
