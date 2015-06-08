# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname='perl-catalyst-model-dbi'
_pkgname='Catalyst-Model-DBI'
pkgver='0.32'
pkgrel='1'
pkgdesc="Catalyst::Model::DBI - DBI Model Class"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-catalyst-runtime' 'perl-mro-compat' 'perl-dbix-connector')
makedepends=('perl-test-use-ok')
url='http://search.cpan.org/dist/Catalyst-Model-DBI'
source=("http://search.cpan.org/CPAN/authors/id/A/AL/ALEXP/${_pkgname}-${pkgver}.tar.gz")
md5sums=('23597fb16c3cc58830be4abc13b6f5ed')
sha512sums=('d2e107327f0b4c5aaa87904c9b24504952c62250ad356c3ba9892b21c996b8be6cb1a6f31e7b4aa3b360a0c6c957aac845268048672c57b6a8700b79bdc14c08')

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
