# Contributor: chimeracoder <dev@chimeracoder.net
pkgname='perl-moosex-types'
pkgver='0.44'
pkgrel='1'
pkgdesc="Organise your Moose types in libraries"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-carp-clan>=6.00' 'perl-namespace-clean>=0.19' 'perl-sub-install>=0.924' 'perl-sub-name')
makedepends=('perl-moose' 'perl-test-fatal' 'perl-test-requires')
url='http://search.cpan.org/dist/MooseX-Types'
source=("http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/MooseX-Types-${pkgver}.tar.gz")
md5sums=('1cd415f6773a0a426e0be068a6c237b7')
sha512sums=('76bdcf28cbfb0ff3cc2da79220f7c8d52a52c8e78d0eb7cfca1035a24e9bfc8d637f131c0dfa24a2fa6ac63ccaf9c019fbb2d51a37ecdea64e1c61bb320ae3af')
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
