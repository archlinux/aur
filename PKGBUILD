# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname='perl-starman'
_pkgname='Starman'
pkgver='0.4011'
pkgrel='1'
pkgdesc="Starman launcher"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1' 'perl-data-dump' 'perl-http-date' 'perl-http-parser-xs' 'perl-http-message' 'perl-net-server>=2.007' 'perl-plack>=0.9971')
makedepends=('perl-extutils-makemaker>=6.59' 'perl-test-requires' 'perl-test-tcp' 'perl-module-build-tiny>=0.018')
url="http://search.cpan.org/dist/Starman"
source=("http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('2221921694f9869eef081f4de523c424ec11cf3fb7d76666e7dc825d677e5e1eed670398e8c9dfdb9a5ec29edaf04e948d0ff9f878e22bd7b7b5c7902723e946')

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
