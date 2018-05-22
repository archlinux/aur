# Maintainer: Benjamin Hodgetts <ben@xnode.org>

pkgname=vice-svn
pkgver=r34920
pkgrel=1
pkgdesc="The Versatile Commodore Emulator (Commodore 64/C64)."
arch=('i686' 'x86_64')
url="http://vice-emu.sourceforge.net"
license=('GPL')
depends=('giflib' 'lame' 'libjpeg' 'libpng' 'libxrandr' 'libnet' 'libpcap' 'xdialog')
makedepends=('xorg-font-utils' 'pkg-config')
optdepends=('pulseaudio' 'pulseaudio-alsa' 'alsa-lib')
provides=('vice')
replaces=('vice')
source=("${pkgname}::svn://svn.code.sf.net/p/vice-emu/code/trunk" 'vice-fixes.patch')
md5sums=('SKIP' '6ae696148e372bcdc7aa21e4fc39e5d2')

pkgver() {
	echo r$(svnversion "${SRCDEST}"/${pkgname}/)
}

prepare() {
	cd "${pkgname}/vice"
	patch -Np1 -i ../../vice-fixes.patch
}

build() {
	cd "${pkgname}/vice"
	./autogen.sh
	./configure --prefix=/usr --without-oss --without-alsa --enable-native-gtk3ui
	make
}

package() {
	cd "${pkgname}/vice"
	make install DESTDIR="${pkgdir}/"
}
