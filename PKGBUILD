# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>
# Previous maintainer: crshd <crshd@mail.com>

pkgname=nafe
pkgver=0.1
pkgrel=2
pkgdesc="Toolset to translate PSF format consolefonts into text files and text files into PSF files."
url="https://nafe.sourceforge.net"
arch=('x86_64' 'i686')
license=('GPL2')
source=("https://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('06d6a9b63f4acff046695c676633895e9d0ae95444de9273b126eace6677102b')


prepare () {
    cd "${srcdir}/${pkgname}-${pkgver}"

    printf '%s\n' '#include <stdlib.h>' | cat - txt2psf.c > txt2psf.c.fixed
    mv txt2psf.c.fixed txt2psf.c

    printf '%s\n' '#include <stdlib.h>' | cat - psf2txt.c > psf2txt.c.fixed
    mv psf2txt.c.fixed psf2txt.c
}

build () {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make all
}

package () {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir -p -- "${pkgdir}/usr/bin"
    cp -- txt2psf psf2txt "${pkgdir}/usr/bin"
}

