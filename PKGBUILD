# Maintainer: Elias Elwyn <a@jthvai.net>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=perl-pgplot
_dist=PGPLOT
pkgver=2.37
pkgrel=1
pkgdesc='PGPLOT module for Perl'
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')

url="https://metacpan.org/dist/$_dist"
_author=ETJ
source=("$pkgname-$pkgver.tar.gz::https://cpan.metacpan.org/authors/id/${_author:0:1}/${_author:0:2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('93e81cd313d1b98abe071374d7c297d850344689c171b6f47fd0fd1424ac142f')

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
optdepends=(
  perl-pdl
)
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
