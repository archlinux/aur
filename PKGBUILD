# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=prboom-svn
pkgver=4553
pkgrel=1
arch=('x86_64')
pkgdesc='A game engine which provides a program to play Doom levels, SVN'
url='http://prboom.sourceforge.net/'
license=('GPL')
depends=('libpng' 'sdl_mixer' 'sdl_net' 'glu')
makedepends=('mesa' 'subversion')
conflicts=('prboom')
source=("prboom::svn+https://svn.prboom.org/repos/trunk/prboom2/")
md5sums=('SKIP')

export CFLAGS+=' -fcommon'

pkgver() {
  cd prboom
  ver="$(svnversion)"
  printf "%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "${srcdir}/prboom"

  sed 's|/games|/bin|g' -i src/Makefile.am
  ./bootstrap
  ./configure --prefix=/usr --disable-i386-asm
  make
}

package() {
  cd "${srcdir}/prboom"
  make DESTDIR="${pkgdir}/" install
}
