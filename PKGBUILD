# Maintainer: Python Shell <pythonshell@yeah.net>

pkgname=cbmc-git
pkgver=5.10.r572.gf9a09d876
pkgrel=1
pkgdesc="Bounded Model Checking for ANSI-C"
arch=('i686' 'x86_64')
url="http://www.cprover.org/cbmc/"
license=('custom')
depends=('flex' 'bison')
makedepends=('git' 'patch' 'make' 'perl-libwww' 'perl-lwp-protocol-https')
provides=('cbmc-git')
conflicts=('cbmc' 'cbmc-bin')
source=('cbmc-git::git+https://github.com/diffblue/cbmc.git')
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
    cd "${srcdir}/${pkgname}/src/"
    make minisat2-download
    #make libzip-download zlib-download
    #make libzip-build
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
