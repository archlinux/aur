# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Kars Wang <jaklsy AT gmail.com>

pkgname='perl-perl-prereqscanner'
pkgver=1.100
pkgrel=1
pkgdesc='a tool to scan your Perl code for its prerequisites'
_dist='Perl-PrereqScanner'
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic' 'GPL')
depends=('perl-getopt-long-descriptive' 'perl-module-path' 'perl-moo' 'perl-ppi'
         'perl-string-rewriteprefix' 'perl-type-tiny' 'perl-namespace-autoclean')
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/$_dist-$pkgver.tar.gz")
sha256sums=('01181d38a2e7aff838d262122563c50636ba4b3652ee5d1d4f8ef5ba3f5b186b')

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
