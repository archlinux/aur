# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname='perl-graph'
_dist='Graph'
pkgver='0.9734'
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
b2sums=('fe408e52cf61e64b05f24fd96ab48ca0b4b191571bc6d97c7d29b3f52c2092e4bdc0e4556f814ea76dd4c0cf6f4de6b185a7c2936bfb821734b4e6869201b4b1')

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
