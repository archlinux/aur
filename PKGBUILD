#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname='perl-graph'
_dist='Graph'
pkgver='0.9724'
pkgrel='1'
pkgdesc='graph data structures and algorithms'
url='https://metacpan.org/release/Graph'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=(
  'perl'
  'perl-heap'
  'perl-set-object'
)

source=("http://search.cpan.org/CPAN/authors/id/E/ET/ETJ/$_dist-$pkgver.tar.gz")
b2sums=('fc36f53b7029b416f5b0abeeacf446d2a3d767f0e10d88712edf06aecd6ed4b30f52efb8c5afa651d1610562d870726e6400ec48ace433e23284a8e5562f73b0')

build() {
  cd "$srcdir/$_dist-$pkgver" || exit

  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT

  export PERL_MM_USE_DEFAULT=1 \
    PERL_AUTOINSTALL=--skipdeps \
    MODULEBUILDRC=/dev/null

  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver" || exit

  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1

  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver" || exit

  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT

  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
