# Maintainer: Python Shell <pythonshell@yeah.net>

pkgname=cbmc
pkgver=5.6
pkgrel=1
pkgdesc="Bounded Model Checking for ANSI-C"
arch=('i686' 'x86_64')
url="http://www.cprover.org/cbmc/"
license=('custom')
depends=('flex' 'bison')
makedepends=('patch' 'make' 'perl-libwww' 'perl-lwp-protocol-https')
provides=('cbmc')
conflicts=('cbmc' 'cbmc-git' 'cbmc-bin')
source=("https://github.com/diffblue/cbmc/archive/cbmc-5.6.tar.gz")
sha256sums=('c6bef63ec42816d0add995ea3b2a5344845cc31f0a6b9e4b8a18df8bb8ad904f')

_pkg_src_root="${pkgname}-${pkgname}-${pkgver}"

build() {
    cd "${srcdir}/${_pkg_src_root}/src/"
    # Makefile typo fix
    sed -i '/libzip_1.1.2.orig/a\\t\@mv libzip_1.1.2.orig.tar.gz libzip-1.1.2.tar.gz' Makefile
    make minisat2-download
    make libzip-download zlib-download
    make libzip-build
    make
}

package() {
    install -D "${srcdir}/${_pkg_src_root}/src/cbmc/cbmc"\
        "${pkgdir}/usr/bin/cbmc"
    install -D "${srcdir}/${_pkg_src_root}/src/goto-cc/goto-cc"\
        "${pkgdir}/usr/bin/goto-cc"
    install -D "${srcdir}/${_pkg_src_root}/src/goto-instrument/goto-instrument"\
        "${pkgdir}/usr/bin/goto-instrument"
    install -D -m644\
        "${srcdir}/${_pkg_src_root}/LICENSE"\
        "${pkgdir}/usr/share/licenses/cbmc/LICENSE"
}
