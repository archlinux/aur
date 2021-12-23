# Maintainer: Giovanni Harting <539 at idlegandalf dot com>

pkgname=perl-net-ftpssl
pkgver=0.42
pkgrel=1
pkgdesc='NET::FTPSSL perl module.'
_dist=Net-FTPSSL
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(perl perl-net-ssleay perl-io-socket-ssl)
options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/C/CL/CLEACH/$_dist-$pkgver.tar.gz")
b2sums=('266b9502576b9054dd330182f636da62af54436f7d4844fecfc15840b66ec07215d29c02f70c745a70867bbd74b0aa28862a989c32f52be78ceb56aa86605f0a')

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

