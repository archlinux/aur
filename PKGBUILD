# Maintainer: Elias Elwyn <a@jthv.ai>
# Contributor: Jose Riha <jose1711 gmail com>

pkgname=perl-uuid
pkgver=0.35
pkgrel=2
pkgdesc='Universally Unique Identifier library for Perl'
_dist=UUID
arch=(i686 x86_64)
url="https://metacpan.org/release/$_dist"
license=(Artistic-2.0)
depends=(perl)
makedepends=(perl-devel-checklib)
source=("https://cpan.metacpan.org/authors/id/J/JR/JRM/$_dist-$pkgver.tar.gz")
options=('!emptydirs')
sha256sums=('41ae4884820ff29eeb3ecf542a16ef7aab687250c4956d876e9e70a88ac6dccf')

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
