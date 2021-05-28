# Contributor: Ordoban <dirk.langer@vvovgonik.de>

pkgname='perl-moosex-methodattributes'
pkgver='0.32'
pkgrel='2'
pkgdesc="code attribute introspection"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moose>=0.98' 'perl-moosex-types' 'perl-namespace-clean>=0.10')
makedepends=('perl-namespace-autoclean' 'perl-test-exception' 'perl-test-checkdeps')
url='https://metacpan.org/release/MooseX-MethodAttributes'
source=("https://cpan.metacpan.org/authors/id/E/ET/ETHER/MooseX-MethodAttributes-$pkgver.tar.gz")
md5sums=('f18009f821e62b3fd9c2605820a0e61b')

build() {
    export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "${srcdir}/MooseX-MethodAttributes-$pkgver"
    /usr/bin/perl Makefile.PL
    make
}

check() {
  cd "${srcdir}/MooseX-MethodAttributes-$pkgver"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
  make test
}

package() {
  cd "${srcdir}/MooseX-MethodAttributes-$pkgver"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
