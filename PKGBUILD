# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Based on vice-svn PKGBUILD by Benjamin Hodgetts <ben@xnode.org>

pkgname=vice-svn-gtk3
_pkgname=vice-svn
pkgver=r38142
pkgrel=1
pkgdesc="The Versatile Commodore Emulator (Commodore 64/C64) - GTK3 development version"
arch=('i686' 'x86_64')
url="http://vice-emu.sourceforge.net"
license=('GPL')
depends=('giflib' 'lame' 'libjpeg' 'libpng' 'libxrandr' 'libnet' 'libpcap' 'xdialog')
makedepends=('pkg-config' 'xa' 'svn' 'texlive-core' 'dos2unix')
optdepends=('pulseaudio' 'pulseaudio-alsa' 'alsa-lib')
provides=('vice')
replaces=('vice')
conflicts=('vice' 'vice-svn' 'vice-svn-sdl2')
source=("${_pkgname}::svn://svn.code.sf.net/p/vice-emu/code/trunk")
sha256sums=('SKIP')

pkgver() {
    echo r$(svnversion "${SRCDEST}"/${_pkgname}/)
}

build() {
    cd "${_pkgname}/vice"
    ./autogen.sh
    ./configure \
    --prefix=/usr \
    --libdir=/usr/lib \
    --enable-external-ffmpeg \
    --enable-x64 \
    --enable-native-gtk3-ui
    make
}

package() {
    cd "${_pkgname}/vice"
    make install DESTDIR="${pkgdir}/"
}
