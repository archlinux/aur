_author=D/DC/DCONWAY
_perlmod=Perl6-Form
pkgname=perl-perl6-form
pkgver=0.090
pkgrel=1
pkgdesc="Perl6::Form - Implements the Perl 6 'form' built-in"
arch=('any')
url='https://metacpan.org/dist/Perl6-Form'
license=('GPL' 'PerlArtistic')
groups=('perl6')
depends=('perl-perl6-export')
makedepends=('perl')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('c60a3433aa70853008e49068f80cc33656e774221c1de568736bdfb567b01c74')
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
