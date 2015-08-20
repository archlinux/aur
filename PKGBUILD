# Maintainer: Kars Wang <jaklsy AT gmail.com>

pkgname='perl-return-multilevel'
pkgver=0.04
pkgrel=1
pkgdesc='return across multiple call levels'
_dist='Return-MultiLevel'
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=('perl>=5.8' 'perl-exporter>=0' 'perl-data-munge>=0.07' 'perl-carp>=0')
checkdepends=('perl-test-fatal>=0' 'perl-test-simple>=0')
makedepends=()
provides=()
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/M/MA/MAUKE/$_dist-$pkgver.tar.gz")
sha256sums=('4c807ca670cfb8db05ccc4b2848ba28618eecfc8147fdadc97f79fb74403a547')

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
