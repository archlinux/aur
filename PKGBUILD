# Maintainer: xRemaLx <anton.komolov@gmail.com>

pkgname='perl-module-scandeps'
_pkgname='Module-ScanDeps'
pkgver='1.18'
pkgrel='1'
pkgdesc="Scan file prerequisites"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008')
makedepends=('perl-extutils-makemaker>=6.57' 'perl-test-requires')
url="http://search.cpan.org/dist/Module-ScanDeps"
source=("http://search.cpan.org/CPAN/authors/id/R/RS/RSCHUPP/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('1c30927454a7e181738eef54767a1845421217e0f6837f8157ec35c604821339238f296a6644e7241f215e66f7ada8ee832a494d9b9f74f8dc3ba219cd616d16')

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
