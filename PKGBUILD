# Maintainer: Elias Elwyn <a@jthvai.net>

pkgname=perl-date-leapyear
_dist=Date-Leapyear
pkgver=1.72
pkgrel=1
pkgdesc='Is a particular year a leap year?'
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')

url="https://metacpan.org/release/$_dist"
source=("$pkgname-$pkgver.tar.gz::https://cpan.metacpan.org/authors/id/R/RB/RBOW/$_dist-$pkgver.tar.gz")
sha256sums=('706360e57a85cf5c0de1cc6502d0366e876df7b42a2e60192861a273750fa603')

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
