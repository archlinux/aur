# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Based on vice-svn PKGBUILD by Benjamin Hodgetts <ben@xnode.org>

pkgname=vice-sdl2-svn
_pkgname=vice-svn
pkgver=r45799
pkgrel=1
pkgdesc="The Versatile Commodore Emulator 8-bits (PET/C64/C128/Plus4/Vic20) - SDL2 development version"
arch=('i686' 'x86_64')
url="http://vice-emu.sourceforge.net"
license=('GPL-2.0-or-later')
depends=(alsa-lib libpulse sdl2_image portaudio pciutils curl mpg123)
makedepends=(dos2unix libpcap libxaw texlive-bin  texlive-plaingeneric xa xorg-bdftopcf xorg-mkfontdir svn)
provides=('vice')
replaces=('vice')
conflicts=('vice' 'vice-svn')
source=("${_pkgname}::svn://svn.code.sf.net/p/vice-emu/code/trunk")
sha256sums=('SKIP')
options=(!debug)

pkgver() {
    echo r$(svnversion "${SRCDEST}"/${_pkgname}/)
}

build() {
    cd "${_pkgname}/vice"
       
    ./autogen.sh
    ./configure --prefix=/usr --libdir=/usr/lib --enable-sdl2ui --enable-pdf-docs --enable-ethernet --with-libcurl --with-mpg123
    make
}

package() {
    cd "${_pkgname}/vice"
    make install DESTDIR="${pkgdir}/"
}
