# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=Regexp-RegGrp
cpanauthor=LEEJO
pkgname=perl-regexp-reggrp
pkgver=2.01
pkgrel=2
pkgdesc="Groups a regular expressions collection"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.9')
makedepends=('perl-extutils-makemaker>=6.6302')
url=http://search.cpan.org/dist/${cpaname}
source=("http://search.cpan.org/CPAN/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
md5sums=('95aac0fb5c099ee8dcd81b2f42221918')
sha256sums=('02118337e7f09fa76cb585c79030e439f017ca791b0a662f8d34008603b7168d')
sha512sums=('742c9760628d32fd60c28fabb4b7e60691e004ed22ae19d0d847e8c432827c9dd150d9d7d0f900274a270d596322d864e976b11e2bcb1135bfc473e61784c542')

build() {
  cd "${srcdir}/${cpaname}-${pkgver}"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null
  perl Makefile.PL
  make
}

check() {
  cd "${srcdir}/${cpaname}-${pkgver}"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
  make test
}

package() {
  cd "${srcdir}/${cpaname}-${pkgver}"
  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
