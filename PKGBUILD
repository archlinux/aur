# Contributor: John Regan <john@jrjrtech.com>
pkgname=perl-io-prompter
pkgver=0.004015
pkgrel=2
pkgdesc='IO::Promter - Prompt for input, read it, clean it, return it.'
_dist=IO-Prompter
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(perl perl-contextual-return)
options=('!emptydirs' purge)
optdepends=(
  'perl-term-readkey: better performance'
)
source=("https://cpan.metacpan.org/authors/id/D/DC/DCONWAY/${_dist}-${pkgver}.tar.gz")
md5sums=('cf40bb0aed4a5a02f98dab854a53737a')

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

