# Maintainer: Peter Ivanov <ivanovp@gmail.com>

pkgname=sometris-git
pkgver=20160628
pkgrel=1
pkgdesc="Tetris-like game written in C and SDL."
arch=('i686' 'x86_64')
url="http://dev.ivanov.eu/"
license=('GPL')
depends=('sdl' 'sdl_gfx' 'sdl_image')
makedepends=('make' 'git')
_gitroot=git://github.com/ivanovp/sometris_sdl.git
_gitname=sometris_sdl
source=("sometris.png" "sometris.desktop" "$_gitname::$_gitroot")

md5sums=('7c27ac4528052e18b6a78b206d510242'
         '79f447ebd88622389dcf8e77093850e6'
         'SKIP')


pkgver() {
  cd "$srcdir/$_gitname"
  git log -1 --format="%cd" --date=short | tr -d '-'
}

build() {
	cd "$srcdir"
	cd "$_gitname"
    make clean
	make
}

package() {
	install -m755 -d $pkgdir/usr/{bin,share/applications,share/pixmaps}

	cd $srcdir
	
	install -D -m644 sometris.desktop $pkgdir/usr/share/applications
	install -D -m644 sometris.png $pkgdir/usr/share/pixmaps

	cd "$_gitname"

    install -D -m755 sometris $pkgdir/usr/bin
	install -m755 -d $pkgdir/usr/share/sometris/gfx
	install -m644 gfx/bg.png $pkgdir/usr/share/sometris/gfx
	install -m644 gfx/block?.png $pkgdir/usr/share/sometris/gfx

}

