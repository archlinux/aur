# Maintainer: Kars Wang <jaklsy AT gmail.com>

pkgname='perl-test-api'
pkgver=0.010
pkgrel=1
pkgdesc='Test a list of subroutines provided by a module'
_dist='Test-API'
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=('perl>=5.6' 'perl-test-simple>=0.86')
checkdepends=('perl-carp>=0' 'perl-scalar-list-utils>=0' 'perl-version>=0' 'perl-exporter>=0' 'perl-test-simple>=1.18' 'perl-pathtools>=0' 'perl-extutils-makemaker>=0')
makedepends=()
provides=()
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/D/DA/DAGOLDEN/$_dist-$pkgver.tar.gz")
sha256sums=('7e6034f0eb29314d31d3354828106ace2745f2160cd3c1443a29b68f53ca2313')

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
