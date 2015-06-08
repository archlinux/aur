# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname='perl-catalyst-plugin-session'
_pkgname='Catalyst-Plugin-Session'
pkgver='0.39'
pkgrel='1'
pkgdesc="Generic Session plugin - ties together server side storage and client side state required to maintain session data."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.0' 'perl-catalyst-runtime' 'perl-mro-compat' 'perl-moose>=0.76' 'perl-moosex-emulate-class-accessor-fast>=0.00801' 'perl-object-signature' 'perl-namespace-clean')
makedepends=('perl-extutils-makemaker>=6.59 perl-test-www-mechanize-psgi')
url="http://search.cpan.org/dist/Catalyst-Plugin-Session"
source=("http://search.cpan.org/CPAN/authors/id/J/JJ/JJNAPIORK/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('8899f1136ce4c2d27f6659a0112804860357933af61280496b4b8876df7f99e841571d8ef5ba1f2ce522a3b653a961bf354f2a0f6f61a361985196a66c9bdc2b')

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
