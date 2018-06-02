# Maintainer:  Yigit Dallilar <yigit.dallilar@gmail.com>

pkgname=isis
pkgver=1.6.2
pkgrel=1
pkgdesc="ISIS is designed to facilitate the interpretation and analysis of high resolution X-ray spectra."
url="http://space.mit.edu/asc/isis/"
arch=('x86_64')
license=('GPL2')
depends=('slang' 'heasoft' 'pgplot' 'cfitsio')
makedepends=('gcc-fortran')
provides=()
conflicts=()
replaces=()
backup=()
source=("ftp://space.mit.edu/pub/cxc/ISIS/isis-${pkgver}-41.tar.gz")
sha1sums=('35ae652287fb701f8f524b13f80d7d83f50ce418')
install="${pkgname}.install"

build() {

    _glibcver=$(pacman -Q glibc | cut -c7-10)

    HEADAS=/opt/heasoft/x86_64-pc-linux-gnu-libc${_glibcver}

    cd $srcdir/${pkgname}-${pkgver}-41
    ./configure --prefix=${pkgdir}/opt/${pkgname} --with-headas=$HEADAS
    make

}

check() {

    cd $srcdir/${pkgname}-${pkgver}-41
    make check

}

package() {
    
    cd $srcdir/${pkgname}-${pkgver}-41
    make install

    install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

}

# vim:set ts=4 sw=4 et:

