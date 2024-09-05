# Maintainer: Elias Elwyn <a@jthv.ai>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=perl-opengl-glut
_dist=OpenGL-GLUT
pkgver=0.72
pkgrel=5
pkgdesc='Perl bindings to GLUT/FreeGLUT GUI toolkit'
license=('GPL-1.0-or-later OR Artistic-1.0-Perl')

url="https://metacpan.org/release/$_dist"
source=("$pkgname-$pkgver.tar.gz::https://cpan.metacpan.org/authors/id/E/ET/ETJ/$_dist-$pkgver.tar.gz")
sha256sums=('c91cf280ddd5505e933b1f66fd3b541e504ea59e64bfe1bdceeabd41b17e2d11')

arch=(x86_64)
depends=(
  perl
  perl-opengl # possibly also OpenGL::Modern ?
  glibc
  libGL.so=1-64
  freeglut
  # libglut.so=3
)
options=('!emptydirs')

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
