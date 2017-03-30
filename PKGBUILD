# Maintainer: xRemaLx <anton.komolov@gmail.com>

pkgname='perl-module-scandeps'
_pkgname='Module-ScanDeps'
pkgver='1.23'
pkgrel='1'
pkgdesc="Scan file prerequisites"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008')
makedepends=('perl-extutils-makemaker>=6.57' 'perl-test-requires')
url="http://search.cpan.org/dist/Module-ScanDeps"
source=("http://search.cpan.org/CPAN/authors/id/R/RS/RSCHUPP/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('7ceb1705aa9be7601a44dea2521a0952de70eb294a88939147d254c3af7056602bbfab97fd117ac4f4184da92354aa1f83f1207d84bf502eb02b0c60fc417ba8')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "${srcdir}/${_pkgname}-${pkgver}" 
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
