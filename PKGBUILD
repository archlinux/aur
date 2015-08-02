# Maintainer: Kars Wang <jaklsy AT gmail.com>

pkgname='perl-perl-prereqscanner'
pkgver=1.023
pkgrel=1
pkgdesc='a tool to scan your Perl code for its prerequisites'
_dist='Perl-PrereqScanner'
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic' 'GPL')
depends=('perl>=5.8' 'perl-module-path>=0' 'perl-namespace-autoclean>=0' 'perl-string-rewriteprefix>=0.005' 'perl-lib>=0' 'perl-scalar-list-utils>=0' 'perl-moose>=0' 'perl-list-moreutils>=0' 'perl-ppi>=1.215' 'perl-getopt-long>=0' 'perl-getopt-long-descriptive>=0' 'perl-params-util>=0' 'perl-pathtools>=0' 'perl-cpan-meta-requirements>=2.124')
checkdepends=('perl-extutils-makemaker>=0' 'perl-try-tiny>=0' 'perl-file-temp>=0' 'perl-test-simple>=0.96' 'perl-ppi>=0' 'perl-pathtools>=0')
provides=('perl-perl-prereqscanner-scanner=1.022' 'perl-perl-prereqscanner-scanner-aliased=1.022' 'perl-perl-prereqscanner-scanner-moose=1.022' 'perl-perl-prereqscanner-scanner-perl5=1.022' 'perl-perl-prereqscanner-scanner-superclass=1.022' 'perl-perl-prereqscanner-scanner-poe=1.022' 'perl-perl-prereqscanner-scanner-testmore=1.022')
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/$_dist-$pkgver.tar.gz")
sha256sums=('280a1c4710390865fb9f310a861a34720b28b4cbe50609c841af5cf2d3a2bced')

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
