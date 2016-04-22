# Maintainer: Frederic Bezies < fredbezies at gmail dot com >
# Contributor: qs9rx < that nick at enjoys döt it>
# Contributor: Christoph Zeiler <rabyte*gmail> (the fitzquake PKGBUILD was a base)
pkgname=quakespasm-svn
_pkgname=quakespasm
pkgver=1299
pkgrel=1
pkgdesc="A modern Quake 1 engine. Forked from Fitzquake and improved in many ways such as Vorbis/MP3 support for music."
arch=('i686' 'x86_64')
url="http://quakespasm.sourceforge.net"
license=('GPL2')
depends=('libvorbis' 'libmad' 'sdl2')
makedepends=('subversion')
install=$pkgname.install
md5sums=('SKIP')

source=('svn+https://svn.code.sf.net/p/quakespasm/code/trunk/quakespasm')

pkgver() {
  cd "$srcdir/$_pkgname"
  svnversion
}

build() {
  cd "$srcdir/$_pkgname/Quake/"
  msg "Starting make..."
  make DO_USERDIRS=1 USE_SDL2=1
}

package() {
  cd "$srcdir/$_pkgname/Quake/"
  install -Dm755 quakespasm "$pkgdir"/usr/bin/$pkgname
}
