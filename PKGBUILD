# Contributor: John Regan <john@jrjrtech.com>
pkgname=perl-io-prompter
pkgver=0.005004
pkgrel=1
pkgdesc='IO::Promter - Prompt for input, read it, clean it, return it.'
_dist=IO-Prompter
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(perl perl-contextual-return perl-match-simple)
options=('!emptydirs' purge)
optdepends=(
  'perl-term-readkey: better performance'
)
source=("https://cpan.metacpan.org/authors/id/D/DC/DCONWAY/${_dist}-${pkgver}.tar.gz")
sha256sums=('29c8b2c30ebdb36fa90cb8a2d5d1b6c4637e98566fbc476262ba1c055fec2061')

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_USE_UNSAFE_INC=1 PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
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

