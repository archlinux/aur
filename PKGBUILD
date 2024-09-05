#!/bin/bash

# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname='perl-graph'
_dist='Graph'
pkgver='0.9732'
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
b2sums=('8c5bffe218d252e4e32796876ce43b7aa9e03b95cb70614af391325c82d44492649929fecf1dd556653fbfbacd8bac041a61cf9c21e993086e7fd5fe7d7d2acb')

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
