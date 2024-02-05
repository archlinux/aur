# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Contributor: Elias Elwyn <a@jthv.ai>

pkgname=perl-test-sharedfork
pkgver=0.35
pkgrel=2
pkgdesc='Utility module for Test::Builder, to test fork(2)'
_dist=Test-SharedFork
arch=(any)
url="https://metacpan.org/release/$_dist"
license=(GPL PerlArtistic)
depends=(perl perl-test-requires)
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/E/EX/EXODIST/$_dist-$pkgver.tar.gz")
sha256sums=(2932e865610e80758f764c586757ef8e11db1284d958e25e4b7a85098414c59f)

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
