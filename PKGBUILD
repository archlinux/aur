# Maintainer : Michael DeGuzis <mdeguzis@gmail.com>

pkgname=ftequake
_svndir=trunk
pkgver=r5054
pkgrel=1
pkgdesc="FTE QuakeWorld. Engine for Quake 1,2,3 and Hexen 2"
arch=('i686' 'x86_64')
url="http://fte.triptohell.info"
license=('GPL')
makedepends=('ecasound' 'libjpeg-turbo' 'libogg' 'libpng'
	     'libvorbis' 'vulkan-validation-layers' 'zlib' 'mesa'
	     'subversion')
depends=('libpng' 'sdl2' 'vulkan-validation-layers')
conflicts=('ftequake-svn')
provides=('ftequake')
source=("svn+http://svn.code.sf.net/p/fteqw/code/trunk#revision=$pkgver"
	'fteqw-gl.desktop'
	'fteqw-mingl.desktop'
	'fteqw-sv.desktop'
	'fteqw-vk.desktop'
	'commandline.txt'
	'fteqw.png') 
md5sums=('SKIP' 
	 'a52ba6f48f20168d89f5f374f57c4176'
	 'dde36db22cb52b3b805677907c286e11'
	 'b5157c36cc9c0231c6cbac0e566d8784'
	 'c6cc686b4df148f2d77ee315a267faf8'
	 '8dd76f7027810a6d20fa1db654151e9a'
	 '0c1246661ff0e3c27ed0f31ae65bb6ea')

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

  install -Dm644 $startdir/fteqw-gl.desktop "$pkgdir"/usr/share/applications/fteqw-gl.desktop
  install -Dm644 $startdir/fteqw-mingl.desktop "$pkgdir"/usr/share/applications/fteqw-mingl.desktop
  install -Dm644 $startdir/fteqw-sv.desktop "$pkgdir"/usr/share/applications/fteqw-sv.desktop
  install -Dm644 $startdir/fteqw-vk.desktop "$pkgdir"/usr/share/applications/fteqw-vk.desktop

  install -Dm644 $startdir/fteqw.png $pkgdir/usr/share/pixmaps/fteqw.png
  install -Dm644 $startdir/commandline.txt "$pkgdir"/usr/share/games/fteqw

}

