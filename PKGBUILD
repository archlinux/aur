# Contributor: Denton Liu <liu.denton@gmail.com>
pkgname=perl-data-validate-ip
pkgver=0.27
pkgrel=1
pkgdesc='IP address validation subs for Perl.'
_dist=Data-Validate-IP
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(perl perl-netaddr-ip)
checkdepends=(perl-test-requires perl-test-taint)
options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/D/DR/DROLSKY/$_dist-$pkgver.tar.gz")
sha256sums=('e1aa92235dcb9c6fd9b6c8cda184d1af73537cc77f4f83a0f88207a8bfbfb7d6')

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
