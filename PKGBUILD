# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname="perl-hash-merge"
pkgver="0.299"
pkgrel="1"
pkgdesc="Merges arbitrarily deep hashes into a single hash"
arch=("any")
license=("PerlArtistic" "GPL")
options=("!emptydirs")
depends=("perl-clone-choose>=0.008" "perl-scalar-list-utils")
makedepends=("perl-clone" "perl-clone-pp")
url="http://search.cpan.org/dist/Hash-Merge"
source=("https://cpan.metacpan.org/authors/id/H/HE/HERMES/Hash-Merge-${pkgver}.tar.gz")
sha512sums=('eca30f92d575619e221a3a2fdb3ad4023dca13eb61d3f947b60ae95265f11da9fc3c14d8771c49c9a67cb58ad7761283f4e752032eca8ae027b27188d60bf119')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Hash-Merge-${pkgver}"
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
