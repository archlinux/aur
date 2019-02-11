# Maintainer: Python Shell <pythonshell@yeah.net>

pkgname=cbmc-git
pkgver=5.11.r1339.gabbb38942
pkgrel=1
pkgdesc="Bounded Model Checking for ANSI-C"
arch=('i686' 'x86_64')
url="http://www.cprover.org/cbmc/"
license=('custom')
depends=('flex' 'bison')
makedepends=('git' 'patch' 'make' 'perl-libwww' 'perl-lwp-protocol-https' 'cmake' 'doxygen')
provides=('cbmc-git')
conflicts=('cbmc' 'cbmc-bin')
source=('cbmc-git::git+https://github.com/diffblue/cbmc.git#branch=develop')
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --tags --long | sed 's/^cbmc-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

#prepare() {
#    cd "$srcdir/${pkgname%-git}"
#}

build() {
    cd "${srcdir}/${pkgname}/"
    #make -C src clean
    #cmake -H. -Bbuild
    #cmake --build build
    make -C src minisat2-download
    make -C src
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
