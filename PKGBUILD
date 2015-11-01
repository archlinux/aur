# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: chimeracoder <dev@chimeracoder.net
pkgname='perl-moosex-types'
pkgver='0.46'
pkgrel=2
pkgdesc="Organise your Moose types in libraries"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-carp-clan>=6.00' 'perl-namespace-clean>=0.19' 'perl-sub-install>=0.924' 'perl-sub-name' 'perl-sub-exporter-formethods')
makedepends=('perl-moose' 'perl-test-fatal' 'perl-test-requires')
url='http://search.cpan.org/dist/MooseX-Types'
source=("http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/MooseX-Types-${pkgver}.tar.gz")
md5sums=('e1debd6007b9cc494636499397c6dabf')
sha512sums=('9eee2afb7122d63a43af8c193c82fd9bf3600245956b7878badedf42280aa38814bf7370da31ede0f437e44f368d68d9c600a4f90bf42f95fa8fdb16b1056d4e')
_distdir="MooseX-Types-${pkgver}"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
