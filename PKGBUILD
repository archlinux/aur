# Maintainer: Slithery <aur at slithery dot uk>

pkgname=perl-io-lockedfile
pkgver=0.23
pkgrel=2
pkgdesc="Supply object methods for locking files."
_dist=IO-LockedFile
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(perl)
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/R/RA/RANI/$_dist-$pkgver.tar.gz")
sha256sums=('b1db7e6a6bf1be1e0615a6ecb5cebe78b00e287b127d5856d3f16b35dd47f8b5')

build() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
)

check() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
)

package() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
)
