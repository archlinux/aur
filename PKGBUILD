# Maintainer: Elias Elwyn <a@jthv.ai>

pkgname=perl-alien-build-plugin-pkgconfig-ppwrapper
pkgver=0.01
pkgrel=1
pkgdesc='Alien::Build plugin to ensure the pure perl PkgConfig is not run by the MSYS perl'
_dist=Alien-Build-Plugin-PkgConfig-PPWrapper
arch=(any)
url="https://metacpan.org/release/$_dist"
license=(GPL PerlArtistic)
depends=(
  perl
  perl-alien-build
  perl-path-tiny
)
checkdepends=(
  perl-capture-tiny
  perl-data-dump
  perl-test2-suite
)
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/S/SL/SLAFFAN/$_dist-$pkgver.tar.gz")
sha256sums=(0c87a75c8781c9bcf4c58ebc67b3de152b6f36d681ff33f0b38b1e507f144bcc)

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
