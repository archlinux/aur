# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-json-any'
pkgver='1.38'
pkgrel='1'
pkgdesc="Wrapper Class for the various JSON classes."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-json>=2.02' 'perl-json-xs>=2.3' 'perl-yaml-syck' 'perl-namespace-clean')
makedepends=('perl-test-fatal' 'perl-test-requires' 'perl-test-warnings>=0.009' 'perl-test-without-module')
url='http://search.cpan.org/dist/JSON-Any'
source=("http://cpan.metacpan.org/authors/id/E/ET/ETHER/JSON-Any-${pkgver}.tar.gz")
md5sums=('8f86b73f560a964d022e9198dc13110e')
sha512sums=('ad847fe9b8787c467536873d7f5061a74d4d6d5488ba053dca1c677c98e69349027ab1734601e8334f1c1c20ee0952754d2562a00694bbd0eb65dee8c333f4d4')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/JSON-Any-${pkgver}"
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
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
