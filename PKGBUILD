# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=perl-http-dav
pkgver=0.50
pkgrel=1
pkgdesc='A client module for the WebDAV protocol'
arch=('any')
license=('PerlArtistic' 'GPL')
depends=('perl-libwww' 'perl-uri' 'perl-xml-dom')
url='https://metacpan.org/release/HTTP-DAV'
source=("https://cpan.metacpan.org/authors/id/C/CO/COSIMO/HTTP-DAV-${pkgver}.tar.gz")
b2sums=('eb661803af991c635f60ea913f7da2fcb6b733ba7265201c355dc7700745eace7389e6d9f64e6cbd48f0d8e6ee428e7f3d1ca9c86c56e577b6eafcd16e0d533d')

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
