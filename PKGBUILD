# Maintainer: Elias Elwyn <a@jthv.ai>

pkgname=perl-alien-proj
_dist=Alien-proj
pkgver=1.30
pkgrel=2
pkgdesc='Compile the Proj library'
license=('GPL-1.0-or-later OR Artistic-1.0-Perl')

url="https://metacpan.org/release/$_dist"
source=("$pkgname-$pkgver.tar.gz::https://cpan.metacpan.org/authors/id/S/SL/SLAFFAN/$_dist-$pkgver.tar.gz")
sha256sums=('49b7b9cdab32bf41ad863501d32e19eba586ba6f43fde465d6c5596fb33dd7a0')

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
