# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=Regexp-RegGrp
cpanauthor=LEEJO
pkgname=perl-regexp-reggrp
pkgver=2.00
pkgrel=1
pkgdesc="Groups a regular expressions collection"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.9')
makedepends=('perl-extutils-makemaker>=6.6302')
url=http://search.cpan.org/dist/${cpaname}
source=("http://search.cpan.org/CPAN/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
md5sums=('c593021a19341130348f11560d15d303')
sha256sums=('0dbce0eefd5a1b9d7a54e8f08ba95648e29db15934eda5a579fc8ae3caf9baea')
sha512sums=('20a9bb52c403a98a8be6ace6fa2f3896edaeedd2c46fa44233787638ad2266f7858757d50862fee25fddb4eff0847487f9d1c2469687a9002ebb86e6d119dbc9')

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
