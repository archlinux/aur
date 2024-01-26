# Contributor: Mark Gallagher <mark@fts.scot>
pkgname=perl-moosex-hasdefaults
pkgver=0.03
pkgrel=3
pkgdesc='default "is" to "ro" or "rw" for all attributes (via MetaCPAN distribution)'
_dist=MooseX-HasDefaults
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-moose')
makedepends=('perl-module-install')
checkdepends=('perl-test-exception')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/S/SA/SARTAK/$_dist-$pkgver.tar.gz")
sha256sums=(1efe4b6639ee8f8f9f57c4c56dd1d65b596819a82c7ac0f8a3046a80d2e51f83)

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

