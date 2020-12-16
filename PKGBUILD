# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Benjamin Hodgetts <ben@xnode.org>

pkgname=vice-svn
pkgver=r39322
pkgrel=1
pkgdesc="The Versatile Commodore Emulator (Commodore 64/C64). - Development version"
arch=('i686' 'x86_64')
url="http://vice-emu.sourceforge.net"
license=('GPL')
depends=('giflib' 'mpg123' 'gtk3' 'pciutils' 'portaudio' 'glew' 'flac')
makedepends=('pkg-config' 'xa' 'svn' 'texlive-core' 'dos2unix')
optdepends=('pulseaudio-alsa' 'alsa-lib')
provides=('vice')
replaces=('vice')
conflicts=('vice' 'vice-sdl2' 'vice-svn-gtk3' 'vice-svn-sdl2')
source=("${pkgname}::svn://svn.code.sf.net/p/vice-emu/code/trunk")
sha256sums=('SKIP')

pkgver() {
	echo r$(svnversion "${SRCDEST}"/${pkgname}/)
}

build() {
    cd "${pkgname}/vice"
    ./autogen.sh
    ./configure --prefix=/usr --libdir=/usr/lib --enable-external-ffmpeg --enable-x64
    make 
}

package() {
	cd "${pkgname}/vice"
	make install DESTDIR="${pkgdir}/"
	#mkdir $pkgdir/usr/share/applications/
	#mv $pkgdir/usr/share/vice/common/*.desktop $pkgdir/usr/share/applications/
}
