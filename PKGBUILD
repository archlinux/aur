# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: chimeracoder <dev@chimeracoder.net
pkgname='perl-moosex-types'
pkgver='0.50'
pkgrel=1
pkgdesc="Organise your Moose types in libraries"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-carp-clan>=6.00' 'perl-namespace-clean>=0.19' 'perl-sub-install>=0.924' 'perl-sub-name' 'perl-sub-exporter-formethods')
makedepends=('perl-moose' 'perl-test-fatal' 'perl-test-requires')
url='http://search.cpan.org/dist/MooseX-Types'
source=("http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/MooseX-Types-${pkgver}.tar.gz")
md5sums=('99b0999ce024c5f27ac00a42a7244ec4')
sha512sums=('42606b1caeb6423acaaa9288239c63512f398a2fba45492443d3e003c6ae3e93cbd8ea2631d487e428ea7d25b63744e4c2096a1e53012e262c99ff4b0c29484b')
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
