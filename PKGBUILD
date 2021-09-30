# Contributor: Bug <bug2000@gmail.com> [Thank you the all mighty omp!]
# Maintainer: Bug <bug2000@gmail.com>
pkgname=byond
_pkgvermajor=514
_pkgverminor=1568
pkgver="$_pkgvermajor.$_pkgverminor"
pkgrel=1
pkgdesc="Game server based on the 'Byond' language [Build your own net dream]."
arch=('i686' 'x86_64')
url="https://secure.byond.com/"
license=('unknown')
depends=('libpng' 'libstdc++5' 'ncurses' 'gcc-libs')
source=("https://secure.byond.com/games/download/build/${_pkgvermajor}/${pkgver}_byond_linux.zip")
md5sums=('5b8be8a2465e31965cf457cc329e50ad')
build() {
    cd "${srcdir}/${pkgname}"
    chmod 644 man/man6/DreamDaemon.6
    chmod 644 man/man6/DreamMaker.6

    sed -i \
        -e "/^BYOND_SYSTEM/s|=.*|= ${pkgdir}/usr/share/byond|" \
        -e "/^BIN_DIR/s|=.*|= ${pkgdir}/usr/bin|" \
        -e "/^LIB_DIR/s|=.*|= ${pkgdir}/usr/lib|" \
        -e "/^MAN_DIR/s|=.*|= ${pkgdir}/usr/share/man|" \
        -e "/ln -f -s/s|\$(BYOND_SYSTEM)|/usr/share/byond|" \
        -e "s/libzip/libext/g" \
        -e "/libpng/d" \
        -e "/ldconfig/d" \
    Makefile
    make
}

package(){
    cd "${srcdir}/${pkgname}"
    mkdir -p "${pkgdir}/usr/"{bin,lib,share/byond,share/man/man6}
    make install
}
