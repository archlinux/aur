# Maintainer : Zachary Freed <theconfuzzleddude@gmail.com>
# Contributor : Michael DeGuzis <mdeguzis@gmail.com>

pkgname=ftequake
_svndir=trunk
pkgver=r5529
pkgrel=1
pkgdesc="FTE QuakeWorld. Engine for Quake 1,2,3 and Hexen 2"
arch=('i686' 'x86_64')
url="http://fte.triptohell.info"
license=('GPL')
makedepends=('ecasound' 'libjpeg-turbo' 'libxkbcommon' 'speex' 'opus' 'libogg' 'libpng'
	     'libvorbis' 'vulkan-validation-layers' 'zlib' 'mesa' 'freetype2'
	     'subversion')
depends=('libpng' 'sdl2' 'vulkan-validation-layers')
conflicts=('ftequake-svn')
provides=('ftequake')
source=("svn+http://svn.code.sf.net/p/fteqw/code/trunk#revision=$pkgver"
	'fteqw.desktop'
	'fteqw-sv.desktop'
	'fteqw.png') 
md5sums=('SKIP'
         '38b6927a580ea7fa64f161bea8dc6240'
         'b5157c36cc9c0231c6cbac0e566d8784'
         '0c1246661ff0e3c27ed0f31ae65bb6ea')

build() {

  cd $_svndir

  make -C engine dbg CFLAGS+=' -fcommon'

}

package() {
 
  cd "$srcdir/$_svndir/engine/debug"

  install -Dm755 fteqcc "$pkgdir"/usr/bin/fteqcc
  install -Dm755 fteqw "$pkgdir"/usr/bin/fteqw
  install -Dm755 fteqw-sv "$pkgdir"/usr/bin/fteqw-sv

  install -Dm644 $startdir/fteqw.desktop "$pkgdir"/usr/share/applications/fteqw.desktop
  install -Dm644 $startdir/fteqw-sv.desktop "$pkgdir"/usr/share/applications/fteqw-sv.desktop

  install -Dm644 $startdir/fteqw.png $pkgdir/usr/share/pixmaps/fteqw.png

}

