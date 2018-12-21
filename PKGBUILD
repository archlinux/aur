# Maintainer: Giovanni Harting <539 at idlegandalf dot com>

pkgname=perl-net-ftpssl
pkgver=0.41
pkgrel=1
pkgdesc='NET::FTPSSL perl module.'
_dist=Net-FTPSSL
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(perl perl-net-ssleay perl-io-socket-ssl)
options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/C/CL/CLEACH/$_dist-$pkgver.tar.gz")
sha256sums=('da63355269c04428f3e810a6fdeecd8884180431fd02692a7cfbcbbc62d2a5c7')

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

