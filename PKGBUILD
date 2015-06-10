# Maintainer: DuckHunt <vaporeon@tfwno.gf>

pkgname=prboom-svn
pkgver=4408
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='A game engine which provides a program to play Doom levels, SVN'
url='http://prboom.sourceforge.net/'
license=('GPL')
depends=('libpng' 'sdl_mixer' 'sdl_net' 'glu')
makedepends=('mesa' 'subversion')
conflicts=('prboom')
source=("prboom::svn+https://svn.prboom.org/repos/trunk/prboom2/")
md5sums=('SKIP')

pkgver() {
  cd prboom
  local ver="$(svnversion)"
  printf "%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir/prboom"

  sed 's|/games|/bin|g' -i src/Makefile.am
  sh bootstrap
  ./configure --prefix=/usr --disable-i386-asm
  make
}

package() {
  cd "$srcdir/prboom"

  make DESTDIR="$pkgdir/" install
}
