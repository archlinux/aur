# Maintainer: xRemaLx <anton.komolov@gmail.com>

pkgname='perl-module-scandeps'
_pkgname='Module-ScanDeps'
pkgver='1.20'
pkgrel='1'
pkgdesc="Scan file prerequisites"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008')
makedepends=('perl-extutils-makemaker>=6.57' 'perl-test-requires')
url="http://search.cpan.org/dist/Module-ScanDeps"
source=("http://search.cpan.org/CPAN/authors/id/R/RS/RSCHUPP/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('1756c48d8932d50f03e5440e9b1a1c38c4f795c5701d6c9704cef88ac1162efeefb863f003b105b8516bb9cb8113c9c8524e7c6847070450228ef6baeb4d578d')

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
