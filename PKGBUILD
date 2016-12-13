# Maintainer : Michael DeGuzis <mdeguzis@gmail.com>

pkgname=ftequake-svn
_svndir=trunk
pkgver=r5032
pkgrel=1
pkgdesc="FTE QuakeWorld. Engine for Quake 1,2,3 and Hexen 2 (svn-latest)"
arch=('i686' 'x86_64')
url="http://fte.triptohell.info"
license=('GPL')
makedepends=('ecasound' 'libjpeg-turbo' 'libogg' 'libpng'
	     'libvorbis' 'vulkan-validation-layers' 'zlib' 'mesa'
	     'subversion')
depends=('libpng' 'sdl2' 'vulkan-validation-layers')
conflicts=('ftequake')
provides=('ftequake')
source=('svn+http://svn.code.sf.net/p/fteqw/code/trunk'
	'ftequake-gl.desktop'
	'ftequake-mingl.desktop'
	'ftequake-sv.desktop'
	'ftequake-vk.desktop'
	'commandline.txt'
	'ftequake.png')
md5sums=('SKIP'
	 '3879a4b6ea55c5df364379ab43f90faa'
	 '4f6526adc7e85d779bb09c011d9c2af7'
	 '0a7ddd62dfd97fc0b949d55f4f08182a'
	 'bfedd017177061b25499036727a10723'
	 '8dd76f7027810a6d20fa1db654151e9a'
	 '0c1246661ff0e3c27ed0f31ae65bb6ea')

pkgver() {

  cd $_svndir
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"

}

build() {

  cd $_svndir

  make -C engine sv-rel gl-rel mingl-rel qcc-rel vk-rel

}

package() {
 
  cd $srcdir/$_svndir/engine/release

  install -Dm755 fteqcc "$pkgdir"/usr/bin/fteqcc
  install -Dm755 fteqw-gl "$pkgdir"/usr/bin/fteqw-gl
  install -Dm755 fteqw-mingl "$pkgdir"/usr/bin/fteqw-mingl
  install -Dm755 fteqw-sv "$pkgdir"/usr/bin/fteqw-sv
  install -Dm755 fteqw-vk "$pkgdir"/usr/bin/fteqw-vk

  install -Dm644 $startdir/ftequake-gl.desktop "$pkgdir"/usr/share/applications/ftequake-gl.desktop
  install -Dm644 $startdir/ftequake-mingl.desktop "$pkgdir"/usr/share/applications/ftequake-mingl.desktop
  install -Dm644 $startdir/ftequake-sv.desktop "$pkgdir"/usr/share/applications/ftequake-sv.desktop
  install -Dm644 $startdir/ftequake-vk.desktop "$pkgdir"/usr/share/applications/ftequake-vk.desktop

  install -Dm644 $startdir/ftequake.png $pkgdir/usr/share/pixmaps/ftequake.png
  install -Dm644 $startdir/commandline.txt "$pkgdir"/usr/share/games/ftequake

}

