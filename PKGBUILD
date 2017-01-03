# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname='perl-starman'
_pkgname='Starman'
pkgver='0.4014'
pkgrel='1'
pkgdesc="Starman launcher"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1' 'perl-data-dump' 'perl-http-date' 'perl-http-parser-xs' 'perl-http-message' 'perl-net-server>=2.007' 'perl-plack>=0.9971')
makedepends=('perl-extutils-makemaker>=6.59' 'perl-test-requires' 'perl-test-tcp' 'perl-module-build-tiny>=0.018')
url="http://search.cpan.org/dist/Starman"
source=("http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('27e5735a1bd2c29944c469f19a6e05cae038da0f678ca6a12bdae87dd075e4e433e3f4126507f90284a71aa5baf1b8babd120603d265d8b1f3b7b1a6528e0c9f')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "${srcdir}/${_pkgname}-${pkgver}"
    /usr/bin/perl Build.PL
    ./Build
  )
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    ./Build test
  )
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ( export PERL_AUTOINSTALL=--skipdeps                       \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'"
    ./Build install
  )
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
