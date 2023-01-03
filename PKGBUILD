# Contributor: Kars Wang <jaklsy AT gmail.com>

pkgname='perl-perl-prereqscanner'
pkgver=1.025
pkgrel=1
pkgdesc='a tool to scan your Perl code for its prerequisites'
_dist='Perl-PrereqScanner'
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic' 'GPL')
depends=('perl-moose' 'perl-getopt-long-descriptive' 'perl-module-path' 'perl-ppi' 'perl-string-rewriteprefix')
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/$_dist-$pkgver.tar.gz")
sha256sums=('ac9acde2c608d270336cc1b312cc49a52c603c1163e196fee749cd296321eca7')

build() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
)

check() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
)

package() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
)
