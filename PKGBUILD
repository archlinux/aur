# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-class-method-modifiers'
pkgver='2.11'
pkgrel='2'
pkgdesc="provides Moose-like method modifiers"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-test-fatal' 'perl-test-requires')
url='http://search.cpan.org/dist/Class-Method-Modifiers'
source=("http://cpan.metacpan.org/authors/id/E/ET/ETHER/Class-Method-Modifiers-${pkgver}.tar.gz")
md5sums=('c6982e9e89325713d5afaff82cfe1744')
sha512sums=('668efc01207034f850d411936fc4e5b6900030710a25dda46cb6c5d6d8e081d0d37327945f1bf17e7cda34add1b33e5be3bc7c37b28eeab6a2275d0fbefd9285')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  cd "${srcdir}/Class-Method-Modifiers-${pkgver}"
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
