# Maintainer: Elias Elwyn <a@jthv.ai>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=perl-opengl-glut
pkgver=0.72
pkgrel=2
pkgdesc='Perl bindings to GLUT/FreeGLUT GUI toolkit'
_dist=OpenGL-GLUT
arch=(i686 x86_64)
url="https://metacpan.org/release/$_dist"
license=(GPL PerlArtistic)
depends=(perl perl-opengl)
source=("https://cpan.metacpan.org/authors/id/E/ET/ETJ/$_dist-$pkgver.tar.gz")
options=('!emptydirs')
sha256sums=('c91cf280ddd5505e933b1f66fd3b541e504ea59e64bfe1bdceeabd41b17e2d11')

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
