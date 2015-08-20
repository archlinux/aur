# Maintainer: Kars Wang <jaklsy AT gmail.com>

pkgname='perl-data-munge'
pkgver=0.095
pkgrel=1
pkgdesc='various utility functions'
_dist='Data-Munge'
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=('perl' 'perl-exporter>=0' 'perl-base>=0')
checkdepends=('perl-test-simple>=0' 'perl-test-warnings>=0')
makedepends=()
provides=()
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/M/MA/MAUKE/$_dist-$pkgver.tar.gz")
sha256sums=('2e635a6ce9566a4ecee9c7eec774bc44ded9cf3f9c46fb6e12ddad4950805354')

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
