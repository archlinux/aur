# Contributor: Mark Gallagher <mark@fts.scot>
pkgname=perl-bankaccount-validator-uk
pkgver=0.65
pkgrel=2
pkgdesc='Rules for validating UK bank account (via MetaCPAN distribution)'
_dist=BankAccount-Validator-UK
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-file-sharedir' 'perl-moo' 'perl-namespace-autoclean')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/M/MA/MANWAR/$_dist-$pkgver.tar.gz")
sha256sums=(c5bdb4500d86deb20c3a9377815de580fd4dbd27233312cc17adf8de80cf720a)

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

