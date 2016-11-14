# Maintainer: Xavier Devlamynck <magicrhesus@ouranos.be>
# Contributor: Oliver Jaksch <arch-aur@com-in.de>

pkgname=hatari2
pkgnamereal=hatari
pkgver=2.0.0
pkgrel=3
pkgdesc='An Atari ST and STE emulator'
arch=('i686' 'x86_64')
url='http://hatari.sourceforge.net/'
license=('GPL')
depends=('sdl2' 'libpng' 'portaudio')
optdepends=('zlib' 'portaudio' 'capsimage')
makedepends=('cmake')
conflicts=('hatari')
source=("http://download.tuxfamily.org/${pkgnamereal}/${pkgver}/${pkgnamereal}-${pkgver}.tar.bz2"
	'001-hatari-gentypes-python3-fix.diff')
sha256sums=('52a447a59b6979d55d1525f3c4a21ec013e4371354d6683ede71546c5e6da577'
	    'eceecfd5cdc505e97b4fdb2c94843dc944dd17c3bf873db68afbbcd902e137b3')

build() {
  cd ${pkgnamereal}-${pkgver}
  # https://trac.macports.org/attachment/ticket/52212/001-hatari-gentypes-python3-fix.diff
  patch -p0 < ${srcdir}/001-hatari-gentypes-python3-fix.diff
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgnamereal}-${pkgver}
  make DESTDIR=${pkgdir} install
}
