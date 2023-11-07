_author=S/SZ/SZABGAB
_perlmod=File-Tools
pkgname=perl-file-tools
pkgver=0.10
pkgrel=1
pkgdesc='File::Tools - UNIX tools implemented as Perl Modules and made available to other platforms as well'
arch=('any')
url="https://metacpan.org/release/File-Tools/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
makedepends=(
#perl-test-more => perl-test-simple => perl
perl-test-nowarnings)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('624c73469c89f62e2b8190e2aec8dfcade0d737c15aff203cd1263c5c97b84cd')
unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps MODULEBUILDRC=/dev/null

build(){
  cd "$srcdir"/$_perlmod-$pkgver
  if [ -r Makefile.PL ]; then
    perl Makefile.PL
    make
  elif [ -r Build.PL ]; then
    perl Build.PL
    ./Build
  fi
}
check(){
  cd "$srcdir"/$_perlmod-$pkgver
  if [ -r Makefile.PL ]; then
    make test
  else
    ./Build test
  fi
}
package(){
  cd "$srcdir"/$_perlmod-$pkgver
  
  if [ -r Makefile.PL ]; then
    make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
  else
    ./Build install --installdirs=vendor --destdir="$pkgdir"
  fi
}
