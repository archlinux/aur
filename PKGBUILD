# Maintainer: Elias Elwyn <a@jthvai.net>
# Contributor: René Wagner < rwagner at rw-net dot de>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname=perl-boolean
_dist=boolean
pkgver=0.46
pkgrel=2
pkgdesc='Boolean support for Perl'
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')

url="https://metacpan.org/dist/$_dist"
_author=INGY
source=("$pkgname-$pkgver.tar.gz::https://cpan.metacpan.org/authors/id/${_author:0:1}/${_author:0:2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('95c088085c3e83bf680fe6ce16d8264ec26310490f7d1680e416ea7a118f156a')

arch=(any)
depends=(perl)
options=('!emptydirs')

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL_MM_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL NO_PACKLIST=1 NO_PERLLOCAL=1
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_LOCAL_LIB_ROOT
  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
