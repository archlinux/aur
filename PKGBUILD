# Maintainer: Giovanni Harting <539 at idlegandalf dot com>

pkgname=perl-net-ftpssl
pkgver=0.39
pkgrel=1
pkgdesc='NET::FTPSSL perl module.'
_dist=Net-FTPSSL
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(perl perl-net-ssleay perl-io-socket-ssl)
options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/C/CL/CLEACH/$_dist-$pkgver.tar.gz")
sha256sums=('7a24ae743d749947f374d339185104031db55d6177b537326561965cf382902f')

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

