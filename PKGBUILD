# Contributor: Kars Wang <jaklsy AT gmail.com>

pkgname='perl-devel-findperl'
pkgver=0.015
pkgrel=1
pkgdesc='Find the path to your perl'
_dist='Devel-FindPerl'
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=('perl')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/L/LE/LEONT/$_dist-$pkgver.tar.gz")
sha256sums=('5275b7dc226fe7f16cb69fc6f99f5e29a852c6a4d3b786ab1886a31386743dfc')

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
