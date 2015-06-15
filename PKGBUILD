#! /bin/bash
# Maintainer: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: Paul Bredbury <brebs@sent.com>

pkgname=alienarena-svn
pkgver=r4297
pkgrel=2
pkgdesc="Multiplayer retro sci-fi deathmatch game based on Quake3"
arch=('i686' 'x86_64')
url="http://icculus.org/alienarena/rpa/"
license=('GPL')
groups=('games')
depends=('curl' 'freetype2' 'ode' 'libgl' 'libjpeg' 'libvorbis' 'libxxf86dga' 'libxxf86vm' 'libgl 'sdl 'openal' 'alienarena-data')
makedepends=('subversion')
provides=('alienarena')
conflicts=('alienarena')
source=(svn://svn.icculus.org/alienarena/trunk
		'alienarena.desktop')
sha512sums=('SKIP'
"4ceb9b838f689aa0b60cfb761411f1708ed852970cd62b218fd42d33db7d59c003ee52fcbb39cfe3d150e15d887696f26e9dadf60e4c4fca97c5d574a47f1402")

# View at https://svn.icculus.org/alienarena/trunk/
_datadir="/usr/share/${pkgname}"
_libdir="/usr/lib/${pkgname}"

pkgver() {
  cd trunk/
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
	
	cd trunk/
	
	./configure

	make PREFIX=/usr
}

 package() {
	cd trunk
	
	make DESTDIR=$pkgdir install
	
	mv $pkgdir/usr/local/bin $pkgdir/usr/bin
	mv $pkgdir/usr/local/share $pkgdir/usr/share
	rm $pkgdir/usr/local
	
	install -D -m755 $srcdir/alienarena.desktop $pkgdir/usr/share/applications/alienarena.desktop
}
