# Maintainer: Elias Elwyn <a@jthv.ai>

pkgname=perl-alien-proj
pkgver=1.27
pkgrel=1
pkgdesc='Compile the Proj library'
_dist=Alien-proj
arch=(any)
url="https://metacpan.org/release/$_dist"
license=(GPL PerlArtistic)
depends=(
  proj
  perl
  perl-alien-build
  perl-alien-build-plugin-cleanse-builddir
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
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/S/SL/SLAFFAN/$_dist-$pkgver.tar.gz")
sha256sums=(2b72b31b5a7386339b57ccc4f897031efea950506414be52516d751ec4adbf0f)

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
