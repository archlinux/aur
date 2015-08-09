# Maintainer: Benjamin James <benjamin-james@utulsa.edu>

pkgname=clx-git
_clname=clx
pkgver=r178.0a3bea0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="An X11 client for Common Lisp"
url="https://github.com/sharplispers/clx"
license=('custom')
provides=('clx')
conflicts=('clx')
depends=('x-server' 'sbcl')
makedepends=('git' 'texinfo')
install=clx.install
source=(${pkgname}::git+https://github.com/sharplispers/clx.git
        README.licensing)        
md5sums=('SKIP'
         'SKIP')

pkgver() {
    cd ${srcdir}/${pkgname}

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${srcdir}/${pkgname}/manual

    makeinfo ${_clname}.texinfo
}

package() {
    cd ${srcdir}/${pkgname}

    install -d        ${pkgdir}/usr/share/common-lisp/source/${_clname}
    install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} *.lisp
    install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} ${_clname}.asd
    install -d        ${pkgdir}/usr/share/common-lisp/source/${_clname}/debug
    install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname}/debug debug/*.lisp
    install -d        ${pkgdir}/usr/share/common-lisp/source/${_clname}/demo
    install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname}/demo demo/*.lisp
    install -d        ${pkgdir}/usr/share/common-lisp/source/${_clname}/test
    install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname}/test test/*.lisp
    install -d        ${pkgdir}/usr/share/info
    install -m 644 -t ${pkgdir}/usr/share/info manual/${_clname}.info
    install -d        ${pkgdir}/usr/share/licenses/${_clname}
    install -m 644 -t ${pkgdir}/usr/share/licenses/${_clname} ${srcdir}/README.licensing

    install -d ${pkgdir}/usr/share/common-lisp/systems
    cd         ${pkgdir}/usr/share/common-lisp/systems
    ln -s ../source/${_clname}/${_clname}.asd .
}
