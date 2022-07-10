# Maintainer: Alad Wenter <alad at archlinux dot org>
# Contributor: Jon Ribeiro <contact@jonathas.com>
pkgname=perl-text-findindent
_dist=Text-FindIndent
pkgver=0.11
pkgrel=1
pkgdesc="Heuristically determine the indent style"
arch=(i686 x86_64)
license=('perl')
url="https://metacpan.org/dist/Text-FindIndent"
options=(!emptydirs)
depends=('perl>=5.10.1')
makedepends=('perl')
source=("https://cpan.metacpan.org/authors/id/C/CH/CHORNY/Text-FindIndent-$pkgver.tar.gz")
sha256sums=('d80d4b660c6b0676a9e0cb710c4397fa8c988f18ddb93fb99ae76f75a3af0bcd')

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

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name perllocal.pod -delete
  find "$pkgdir" -name .packlist -delete
}

# vim:set ts=2 sw=2 et:


