# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname='perl-rrdtool-oo'
_pkgname='RRDTool-OO'
pkgver='0.33'
pkgrel='1'
pkgdesc="RRDTool::OO - Object-oriented interface to RRDTool"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('rrdtool' 'perl>=5.6.0' 'perl-log-log4perl')
makedepends=('perl-extutils-makemaker>=6.59' 'perl-test-requires')
url="http://search.cpan.org/dist/RRDTool-OO"
source=("http://search.cpan.org/CPAN/authors/id/M/MS/MSCHILLI/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('8381316dfdd102daf263951b63d2972956d2fc2a539789f61bd5018b5a14d2c45f24e81eaaf416a9e86151bbce99560283eb2e7d41385d92ab0bfa3115dd1591')

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
