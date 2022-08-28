# Contributor: Kars Wang <jaklsy AT gmail.com>

pkgname='perl-perl-prereqscanner'
pkgver=1.024
pkgrel=1
pkgdesc='a tool to scan your Perl code for its prerequisites'
_dist='Perl-PrereqScanner'
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic' 'GPL')
depends=('perl-moose' 'perl-getopt-long-descriptive' 'perl-module-path' 'perl-ppi' 'perl-string-rewriteprefix')
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/$_dist-$pkgver.tar.gz")
sha256sums=('30ebc3871882806589bd8f4d92689113e149c9a596bfd930eba745d54f1a5b64')

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
