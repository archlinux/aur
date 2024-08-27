# Contributor: Mark Gallagher <mark@fts.scot>
pkgname=perl-moosex-strictconstructor
pkgver=0.21
pkgrel=1
pkgdesc='Make your Moose object constructors blow up on unknown attributes'
_dist=MooseX-StrictConstructor
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-moose' 'perl-namespace-autoclean')
checkdepends=('perl-test-fatal' 'perl-test-needs')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/D/DR/DROLSKY/$_dist-$pkgver.tar.gz")
sha256sums=(c72a5ae9583706ccdec71d401dcb3054013a7536b750df1436613d858ea2920d)
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

