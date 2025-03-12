# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-class-c3-componentised'
pkgver='1.001002'
pkgrel='3'
pkgdesc='Load mix-ins or components to your C3-based class'
arch=('any')
license=('Artistic-2.0')
options=('!emptydirs')
depends=('perl-class-c3>=0.20' 'perl-class-inspector>=1.32' 'perl-mro-compat>=0.09')
makedepends=('perl-module-install' 'perl-test-exception>=0.31')
url='http://search.cpan.org/dist/Class-C3-Componentised'
source=("https://cpan.metacpan.org/authors/id/H/HA/HAARG/Class-C3-Componentised-${pkgver}.tar.gz")
sha512sums=('11f7d752fec271e0e1274fcfe56dadece07e79b0986bbad86fff569e74900d9fb2e68a3aeb1e465073f01e3e4dda3f4644117084880321f8213ef05ec7e2bdc0')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  cd "${srcdir}/Class-C3-Componentised-${pkgver}"
}

build() {
  prepare_environment
  /usr/bin/perl Makefile.PL
  make
}

check() {
  prepare_environment
  make test
}

package() {
  prepare_environment
  make install
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
