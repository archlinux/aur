# Maintainer: Ordoban <dirk.langer@vvovgonik.de>

pkgname='perl-catalyst-plugin-static-simple'
_pkgname='Catalyst-Plugin-Static-Simple'
pkgver='0.35'
pkgrel='1'
pkgdesc="Catalyst::Plugin::Static::Simple   Make serving static pages painless."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-catalyst-runtime>=5.80008' 'perl-mime-types>=2.03' 'perl-moose' 'perl-moosex-types' 'perl-namespace-autoclean')
makedepends=('perl-extutils-makemaker>=6.36')
url='http://search.cpan.org/dist/Catalyst-Plugin-Static-Simple'
source=("https://cpan.metacpan.org/authors/id/I/IL/ILMARI/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('1b6ac5f6cd99bc5f40e7b7aafc6f0f9e38f27091d25dde3bff87cfa3650d6efd5631f9f48f7ecb76b1c3358f2c24d18e3f799ce644043c95245fd61dfe612399')

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

  cd "${srcdir}/${_pkgname}-${pkgver}"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make test
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
