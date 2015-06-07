# Maintainer: Slithery <aur at slithery dot uk>

pkgname=perl-log-loglite
pkgver=0.82
pkgrel=1
pkgdesc="Class helps us create simple logs for our application."
_dist=Log-LogLite
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-io-lockedfile')
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/R/RA/RANI/$_dist-$pkgver.tar.gz")
sha256sums=('0509fb8bc543ac9675a48eb1a65a63528608c6c3fdf62a19e17073500e511a6b')

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
