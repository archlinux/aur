# Maintainer: Elias Elwyn <a@jthv.ai>
# Contributor: Jose Riha <jose1711 gmail com>

pkgname=perl-uuid
pkgver=0.36
pkgrel=1
pkgdesc='Universally Unique Identifier library for Perl'
_dist=UUID
arch=(i686 x86_64)
url="https://metacpan.org/release/$_dist"
license=(Artistic-2.0)
depends=(perl)
makedepends=(perl-devel-checklib)
source=("https://cpan.metacpan.org/authors/id/J/JR/JRM/$_dist-$pkgver.tar.gz")
options=('!emptydirs')
sha256sums=('c182e9ad854981a90803ae25380d2197ca6f923519e1d524bc85205eaf49bf06')

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
