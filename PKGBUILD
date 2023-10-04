# Contributor: Mark Gallagher <mark@fts.scot>
pkgname=perl-test2-plugin-nowarnings
pkgver=0.09
pkgrel=1
pkgdesc='A Test2 event for warnings (via MetaCPAN distribution)'
_dist=Test2-Plugin-NoWarnings
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-test-simple')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/D/DR/DROLSKY/$_dist-$pkgver.tar.gz")
sha256sums=(be3dd800042eef362bf17d2056cf9e934dee91ccce98e4f178b8fb5772f2fb74)

build() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}

