# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname='perl-catalyst-plugin-i18n'
_pkgname='Catalyst-Plugin-I18N'
pkgver=0.10
pkgrel=2
pkgdesc='I18N for Catalyst'
arch=(i686 x86_64)
license=('perl')
url="http://search.cpan.org/dist/Catalyst-Plugin-I18N/"
options=(!emptydirs)

depends=('perl>=5.10.1' 'perl-locale-maketext-lexicon' 'perl-catalyst-runtime' 'perl-mro-compat')
makedepends=('perl')

provides=("catalyst-plugin-i18n=${pkgver}" "Catalyst::Plugin::I18N=${pkgver}" "perl-catalyst-plugin-i18n=${pkgver}")

source=("http://search.cpan.org/CPAN/authors/id/B/BO/BOBTFISH/${_pkgname}-${pkgver}.tar.gz")
md5sums=('d0b42885072d49dcd0f5def7eb14d42b')
sha512sums=('69bec461f447febf2e17807ffd409136a703033af02ac9d8c0c8182d45770f0c3ed8146e121c3bed9c1fdda16ca8659c0b16287eae3312b55b0fd9535ceab052')

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

# vim:set ts=2 sw=2 et:
