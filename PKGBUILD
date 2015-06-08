# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname='perl-catalyst-plugin-authentication'
_pkgname='Catalyst-Plugin-Authentication'
pkgver='0.10023'
pkgrel='1'
pkgdesc="Infrastructure plugin for the Catalyst"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1' 'perl-catalyst-plugin-session>=0.10' 'perl-catalyst-runtime' 'perl-class-inspector' 'perl-mro-compat' 'perl-moose' 'perl-moosex-emulate-class-accessor-fast' 'perl-string-rewriteprefix' 'perl-try-tiny' 'perl-namespace-autoclean')
makedepends=('perl-extutils-makemaker>=6.59' 'perl-moose' 'perl-test-exception')
url="http://search.cpan.org/dist/Catalyst-Plugin-Authentication"
source=("http://search.cpan.org/CPAN/authors/id/B/BO/BOBTFISH/${_pkgname}-${pkgver}.tar.gz")
md5sums=('6df0836bab344ef499d68ee5f50f2369')
sha512sums=('b0882ea35409226e1592b5f5473bdf8fdf44a1ee228837d1eaba082a94f129315533271c9077f8895af19a695c279e3f5aa649c6100b2fa17a0a0b04884c279f')

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
