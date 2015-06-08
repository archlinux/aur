# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname='perl-catalyst-plugin-i18n-dbi'
_pkgname='Catalyst-Plugin-I18N-DBI'
pkgver=0.2.5
pkgrel=2
pkgdesc='Catalyst::Plugin::I18N::DBI - DBI based I18N for Catalyst'
arch=(i686 x86_64)
license=('perl')
url="http://search.cpan.org/dist/Catalyst-Plugin-I18N-DBI/"
options=(!emptydirs)

depends=('perl>=5.10.1' 'perl-moose' 'perl-locale-maketext-lexicon>=0.2.0' 'perl-locale-maketext-lexicon-dbi' 'perl-catalyst-runtime')
makedepends=('perl')

provides=('catalyst-plugin-i18n-dbi=0.2.5' 'Catalyst::Plugin::I18N::DBI=0.2.5' 'perl-catalyst-plugin-i18n-dbi=0.2.5')

source=("http://search.cpan.org/CPAN/authors/id/M/MD/MDIETRICH/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('f60e588ecf969e9c77f30aa331e9ab63')
sha512sums=('d4f6315fe195548b4a204094bb26f03fd812998f1710b7adc971bf724ed05506bf3b53d44152be186d6789759f8ac4cfb77febbff73b09fffb401984f3bf4f1b')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "${srcdir}/${_pkgname}-v${pkgver}"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "${srcdir}/${_pkgname}-v${pkgver}"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "${srcdir}/${_pkgname}-v${pkgver}"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# vim:set ts=2 sw=2 et:
