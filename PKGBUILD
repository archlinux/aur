# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-class-accessor-grouped'
pkgver='0.10014'
pkgrel='3'
pkgdesc="Lets you build groups of accessors"
arch=('any')
license=('Artistic-2.0')
options=('!emptydirs')
depends=('perl-module-runtime>=0.012')
makedepends=('perl-test-exception>=0.31')
url='https://metacpan.org/release/Class-Accessor-Grouped'
source=("https://cpan.metacpan.org/authors/id/H/HA/HAARG/Class-Accessor-Grouped-${pkgver}.tar.gz")
sha512sums=('d69fe27c3a12845bb4d0abe6c73d1a82eaf550821184f0945c3802e3932c7742e04c6f655e550386923c2a005e7f893f44ed950c56e6e80785b5a23e7b3c80b3')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  cd "${srcdir}/Class-Accessor-Grouped-${pkgver}"
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
