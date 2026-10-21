# Maintainer: Elias Elwyn <a@jthvai.net>
# Contributor: Jose Riha <jose1711 gmail com>

pkgname=perl-uuid
_dist=UUID
pkgver=0.40
pkgrel=1
pkgdesc='Universally Unique Identifier library for Perl'
license=(Artistic-2.0)

url="https://metacpan.org/release/$_dist"
source=("$pkgname-$pkgver.tar.gz::https://cpan.metacpan.org/authors/id/J/JR/JRM/$_dist-$pkgver.tar.gz")
sha256sums=('acb3a6042f30afd4a96b06654c392514a75f9a1e65636ca7550c697abc7d2fbd')

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
