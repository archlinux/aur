# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=perl-http-dav
pkgver=0.49
pkgrel=1
pkgdesc='A client module for the WebDAV protocol'
arch=('any')
license=('PerlArtistic' 'GPL')
depends=('perl-libwww' 'perl-uri' 'perl-xml-dom')
url='http://search.cpan.org/dist/HTTP-DAV'
source=("http://search.cpan.org/CPAN/authors/id/C/CO/COSIMO/HTTP-DAV-${pkgver}.tar.gz")
b2sums=('202a37766a949441417e6e88de02dcb238f811408f16cc86ebb5187f0cd0c8b780e322b3704dbc115225232c1d815cbe9d5fdb8ac7755e222c7eac5357ea0a81')

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR=${pkgdir}"     \
    PERL_MB_OPT="--installdirs vendor --destdir ${pkgdir}" \
    MODULEBUILDRC=/dev/null

  cd HTTP-DAV-${pkgver}
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd HTTP-DAV-${pkgver}
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
  make test
}

package() {
  cd HTTP-DAV-${pkgver}
  make install
  # remove generated perl docs
  find "${pkgdir}" -name .packlist -o -name perllocal.pod -delete
}
