# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname="perl-clone-choose"
pkgver="0.009"
pkgrel="1"
pkgdesc="choose appropriate clone utility  "
arch=("any")
license=("PerlArtistic" "GPL")
options=("!emptydirs")
makedepends=('perl-test-without-module')
url="http://search.cpan.org/dist/Clone-Choose"
source=("https://cpan.metacpan.org/authors/id/H/HE/HERMES/Clone-Choose-${pkgver}.tar.gz")
sha512sums=('c599e37f950e93e9ed39092105ba2f61b93826f36c341997ff998428b753010190013dc1466d0f7481c57046527b1909ec1ba5b90e486e62ca03e64233941d0d')

_prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Clone-Choose-${pkgver}"
}

build() {
  _prepare_environment
  /usr/bin/perl Makefile.PL
  make
}

check() {
  _prepare_environment
  make test
}

package() {
  _prepare_environment
  make install
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
