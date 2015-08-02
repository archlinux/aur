# Maintainer: Kars Wang <jaklsy AT gmail.com>

pkgname='perl-perl-version'
pkgver=1.013
pkgrel=1
pkgdesc='Parse and manipulate Perl version strings'
_dist='Perl-Version'
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=('perl' 'perl-pod-usage>=1.3' 'perl-scalar-list-utils>=0' 'perl-file-slurp-tiny>=0' 'perl-getopt-long>=2.34' 'perl-data-dumper>=0' 'perl-carp>=0' 'perl-test-simple>=0')
checkdepends=()
makedepends=('perl-extutils-makemaker>=0')
provides=()
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/B/BD/BDFOY/$_dist-$pkgver.tar.gz")
sha256sums=('1887414d1c8689d864c840114101e043e99d7dd5b9cca69369a60e821e3ad0f7')

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
