# Contributor: Mark Gallagher <mark@fts.scot>
pkgname=perl-test2-tools-explain
pkgver=0.02
pkgrel=1
pkgdesc="Explain tools for Perl's Test2 framework (via MetaCPAN distribution)"
_dist=Test2-Tools-Explain
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-test2-suite')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/P/PE/PETDANCE/$_dist-$pkgver.tar.gz")
sha256sums=(e476bd1739e68f418617c308c3c3cf742de6a595c23bbac2c270e14159f73122)

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

