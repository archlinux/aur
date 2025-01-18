#!/bin/bash

# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname='perl-graph'
_dist='Graph'
pkgver='0.9733'
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
b2sums=('f02e239cf3942b68e8c6642762dae76536294ed6808267d8f570878cfd583b9878d893d93dbe91fba7eb0146759c5b034753e68afe64d5cf0944370c3060d75a')

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
