# Maintainer: Elias Elwyn <a@jthv.ai>

pkgname=perl-alien-proj
_dist=Alien-proj
pkgver=1.31
pkgrel=1
pkgdesc='Compile the Proj library'
license=('GPL-1.0-or-later OR Artistic-1.0-Perl')

url="https://metacpan.org/release/$_dist"
source=("$pkgname-$pkgver.tar.gz::https://cpan.metacpan.org/authors/id/S/SL/SLAFFAN/$_dist-$pkgver.tar.gz")
sha256sums=('9d0169833a37d87423830055c2732533dc3907fc32eaa2eec43caf17a3d3e9e7')

arch=(any)
depends=(
  proj
  perl
  perl-alien-build
  perl-alien-build-plugin-pkgconfig-ppwrapper
  perl-alien-sqlite
  perl-ffi-checklib
  perl-file-find-rule
  perl-file-which
  perl-path-tiny
  perl-pkgconfig
  perl-scalar-list-utils
  perl-sort-versions
)
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
