#! /bin/bash
# Maintainer: Lars Rustand <rustand dot lars at gmail dot com>
# Contributor: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: Paul Bredbury <brebs@sent.com>

pkgname=alienarena-svn
pkgver=r5663
pkgrel=1
pkgdesc="Multiplayer retro sci-fi deathmatch game based on Quake2"
arch=('i686' 'x86_64')
url="http://red.planetarena.org/"
license=('GPL')
groups=('games')
depends=('curl' 'freetype2' 'libgl' 'libjpeg' 'libvorbis' 'libxxf86dga' 'libxxf86vm' 'openal')
makedepends=('subversion')
provides=('alienarena')
conflicts=('alienarena')
source=(
  svn://svn.icculus.org/alienarena/trunk
  'alienarena.desktop'
)
sha512sums=(
  'SKIP'
  "4ceb9b838f689aa0b60cfb761411f1708ed852970cd62b218fd42d33db7d59c003ee52fcbb39cfe3d150e15d887696f26e9dadf60e4c4fca97c5d574a47f1402"
)

pkgver() {
  cd trunk/
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {

	cd trunk/

	autoreconf --verbose --force --install
	./configure --enable-maintainer-mode --prefix=/usr --datarootdir=/usr/share --datadir=/usr/share
	make
}

 package() {
	cd trunk

	make DESTDIR=$pkgdir install

	install -D -m755 $srcdir/alienarena.desktop $pkgdir/usr/share/applications/alienarena.desktop
}
