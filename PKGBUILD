_author=A/AZ/AZAWAWI
_perlmod=Padre-Plugin-PerlCritic
pkgname=perl-padre-plugin-perlcritic
pkgver=0.12
pkgrel=3
pkgdesc='Padre::Plugin::PerlCritic - Analyze perl files with Perl::Critic'
arch=('any')
url='https://metacpan.org/dist/Padre-Plugin-PerlCritic'
license=('GPL' 'PerlArtistic')
depends=(
perl-padre
perl-critic
)
makedepends=(perl)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('ad016c41dc53d00b9f550694b51fe1b5f5c8b4b4f4dbcdcabd809092b51baea5')
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
