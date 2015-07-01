# Maintainer: ackalker <a.c.kalker@gmail.com>
# Contributor: Maximilian Stein <maxarchpkgbuild@hmamail.com>
# Contributor: derrida <deleuzians@gmail.com>
# Contributor: gucong <gucong43216@gmail.com>

pkgname=lush2-svn
_pkgver=2.0.1
pkgver=2.0.1.r925
pkgrel=1
pkgdesc="An object-oriented programming language designed for researchers, experimenters, and engineers interested in large-scale numerical and graphic applications."
arch=('x86_64' 'i686')
url="http://lush.sourceforge.net"
license=('LGPL')
depends=('libxft' 'gperftools')
optdepends=('gsl' 'lapack' 'sdl' 'opencv' 'alsa-lib')
makedepends=('subversion' 'texlive-core')
provides=('lush2')
conflicts=('lush2')
source=(svn+http://svn.code.sf.net/p/lush/code/lush2)
sha256sums=('SKIP')
pkgver() {
  cd "$srcdir/lush2"
  local ver="$(svnversion)"
  printf "$_pkgver.r%s" "${ver//[[:alpha:]]}"
}
build() {
  cd "$srcdir/lush2"
  ./configure LIBS="-liberty -lprofiler -lz" X_EXTRA_LIBS=-lfontconfig --prefix=/usr
  make
}
package() {
  cd "$srcdir/lush2"
  make DESTDIR="$pkgdir" install
}
