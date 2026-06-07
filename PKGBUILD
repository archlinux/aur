# Maintainer: Elias Elwyn <a@jthvai.net>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=perl-pgplot
_dist=PGPLOT
pkgver=2.35
pkgrel=3
pkgdesc='PGPLOT module for Perl'
license=('GPL-1.0-or-later OR Artistic-1.0-Perl')

url="https://metacpan.org/release/$_dist"
source=("$pkgname-$pkgver.tar.gz::https://cpan.metacpan.org/authors/id/E/ET/ETJ/$_dist-$pkgver.tar.gz")
sha256sums=('89d18b0157f26c309197411912361357b66e19f978556d0e181019dce754ea3c')

arch=(x86_64)
depends=(
  perl
  pgplot
  glibc
  libgfortran.so=5-64
)
makedepends=(
  perl-devel-checklib
  perl-extutils-f77
)
options=('!emptydirs')

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  # WARN: remove in 2.36
  sed -i 's/^CCFLAGS =\(.*\)$/CCFLAGS =\1 -std=gnu17/' Makefile
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
