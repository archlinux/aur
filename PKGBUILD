# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

_author=D/DC/DCONWAY
_perlmod=Perl6-Form
pkgname=perl-perl6-form
pkgver=0.06
pkgrel=1
pkgdesc="Perl6::Form - Implements the Perl 6 'form' built-in"
arch=('any')
url='http://search.cpan.org/~dconway/Perl6-Form'
license=('GPL' 'PerlArtistic')
groups=('perl6')
depends=('perl-perl6-export')
makedepends=('perl')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('98e4615aac7954ac2c3faf199a3ee042c6063c41a0ccfeb7631e1de5aed55bbc')
unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps MODULEBUILDRC=/dev/null

build(){
  cd "$srcdir"/$_perlmod-$pkgver

  if [ -f Makefile.PL ]; then
    perl Makefile.PL
    make
  else
    perl Build.PL
    ./Build
  fi
}
check(){
  cd "$srcdir"/$_perlmod-$pkgver

  if [ -f Makefile.PL ]; then
    make test
  else
    ./Build test
  fi
}
package(){
  cd "$srcdir"/$_perlmod-$pkgver

  if [ -f Makefile.PL ]; then
    make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
  else
    ./Build install --installdirs=vendor --destdir="$pkgdir"
  fi
}
