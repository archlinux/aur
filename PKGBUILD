# Maintainer: Elias Elwyn <a@jthvai.net>
# Contributor: Jose Riha <jose1711 gmail com>

pkgname=perl-uuid
_dist=UUID
pkgver=0.39
pkgrel=1
pkgdesc='Universally Unique Identifier library for Perl'
license=(Artistic-2.0)

url="https://metacpan.org/release/$_dist"
source=("$pkgname-$pkgver.tar.gz::https://cpan.metacpan.org/authors/id/J/JR/JRM/$_dist-$pkgver.tar.gz")
sha256sums=('fdeea2ef7c285228e0036a0b12c81911c7903ebfb3c51a278f47744db777ec60')

arch=(i686 x86_64)
depends=(perl glibc)
makedepends=(perl-devel-checklib)
options=('!emptydirs')

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
