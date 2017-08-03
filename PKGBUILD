# Maintainer: Ordoban <dirk.langer@vvovgonik.de>

pkgname='perl-catalyst-plugin-static-simple'
_pkgname='Catalyst-Plugin-Static-Simple'
pkgver='0.34'
pkgrel='1'
pkgdesc="Catalyst::Plugin::Static::Simple   Make serving static pages painless."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-catalyst-runtime>=5.80008' 'perl-mime-types>=2.03' 'perl-moose' 'perl-moosex-types' 'perl-namespace-autoclean')
makedepends=('perl-extutils-makemaker>=6.36')
url='http://search.cpan.org/dist/Catalyst-Plugin-Static-Simple'
source=("https://cpan.metacpan.org/authors/id/F/FR/FREW/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('67bf8f7226f025589fe11dde014d3a304823b1b0a8d687d5f011fb950bdaeef993a935ae7f58796f6ccd4628d59169336857ce104d3616bb45eb7a031ee1b5ff')

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
