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
sha512sums=('01a097f47d95090fd0fd08a44b440d0ed4f2f04e0bedc41f8e2abedf1879e7cfcae6cf5cf7a415ac89dc610cf0cacf4f75078586bbf6a818f8c6dd36ccb451f6')

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
