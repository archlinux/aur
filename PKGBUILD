# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=perl-http-dav
pkgver=0.48
pkgrel=1
pkgdesc='A client module for the WebDAV protocol'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-libwww' 'perl-uri' 'perl-xml-dom')
url='http://search.cpan.org/dist/HTTP-DAV'
source=("http://search.cpan.org/CPAN/authors/id/C/CO/COSIMO/HTTP-DAV-${pkgver}.tar.gz")
sha512sums=('2edf92791660b1996eb22b9ea68bd4e417c497afeebb56cb0a2ecf0cf72ea54b6fb8efd4d69dae1dcb946517f917593932a8040bd0ef5cfc83f7fdfd1fe3ccf8')

build() {
    export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR=${pkgdir}"     \
      PERL_MB_OPT="--installdirs vendor --destdir ${pkgdir}" \
      MODULEBUILDRC=/dev/null

    cd ${srcdir}/HTTP-DAV-${pkgver}
    /usr/bin/perl Makefile.PL
    make
}

check() {
  cd $srcdir/HTTP-DAV-${pkgver}
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
  make test
}

package() {
  cd $srcdir/HTTP-DAV-${pkgver}
  make install

  find $pkgdir -name .packlist -o -name perllocal.pod -delete
}
