# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-algorithm-c3'
pkgver='0.11'
pkgrel='1'
pkgdesc="A module for merging hierarchies using the C3 algorithm"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Algorithm-C3'
source=("https://cpan.metacpan.org/authors/id/H/HA/HAARG/Algorithm-C3-${pkgver}.tar.gz")
sha512sums=('ec2ae17090a826e013b7526e7f236e3cc9bc59488421aecb03ea876b6ed2e4b2ea4eb8e07aad57b5b645ca4a077f7064b98e790e9906496d26c1bcb36128acbe')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Algorithm-C3-${pkgver}"
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
