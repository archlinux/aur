# Maintainer: Python Shell <pythonshell@yeah.net>

pkgname=cbmc
pkgver=5.1
pkgrel=2
pkgdesc="Bounded Model Checking for ANSI-C"
arch=('i686' 'x86_64')
url="http://www.cprover.org/cbmc/"
license=('custom')
makedepends=('subversion')
depends=('flex' 'bison' 'make' 'patch' 'perl-libwww')
source=("${pkgname}::svn+http://www.cprover.org/svn/cbmc/releases/cbmc-5.1")
sha1sums=('SKIP')

provides=('cbmc')
conflicts=('cbmc' 'cbmc-bin')

build() {
    cd "${srcdir}/${pkgname}/src/"
    make minisat2-download
    make
}

package() {
    install -D "${srcdir}/${pkgname}/src/cbmc/cbmc"\
        "${pkgdir}/usr/bin/cbmc"
    install -D "${srcdir}/${pkgname}/src/goto-cc/goto-cc"\
        "${pkgdir}/usr/bin/goto-cc"
    install -D "${srcdir}/${pkgname}/src/goto-instrument/goto-instrument"\
        "${pkgdir}/usr/bin/goto-instrument"
    install -D -m644\
        "${srcdir}/${pkgname}/LICENSE"\
        "${pkgdir}/usr/share/licenses/cbmc/LICENSE"
}
