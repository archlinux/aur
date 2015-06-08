# Maintainer: xRemaLx <anton.komolov@gmail.com>

pkgname='perl-catalyst-plugin-static-simple'
_pkgname='Catalyst-Plugin-Static-Simple'
pkgver='0.32'
pkgrel='1'
pkgdesc="Catalyst::Plugin::Static::Simple   Make serving static pages painless."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-catalyst-runtime>=5.80008' 'perl-mime-types>=2.03' 'perl-moose' 'perl-moosex-types' 'perl-namespace-autoclean')
makedepends=('perl-extutils-makemaker>=6.36')
url='http://search.cpan.org/dist/Catalyst-Plugin-Static-Simple'
source=("http://search.cpan.org/CPAN/authors/id/J/JJ/JJNAPIORK/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('c2a2d3efd0ce9ff75f5c8633896350243893be3821c5ad35d8b72adb7ce49a084a02f7d20a82a27ce1cf9e3202f2bec2c02cc14e3f2284593aecb76b6df5b0d3')

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
