# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname="perl-hash-merge"
pkgver="0.300"
pkgrel="1"
pkgdesc="Merges arbitrarily deep hashes into a single hash"
arch=("any")
license=("PerlArtistic" "GPL")
options=("!emptydirs")
depends=("perl-clone-choose>=0.008" "perl-scalar-list-utils")
url="http://search.cpan.org/dist/Hash-Merge"
source=("https://cpan.metacpan.org/authors/id/R/RE/REHSACK/Hash-Merge-${pkgver}.tar.gz")
sha512sums=('a7d988f64ff2487b4d1237d01d424ea49c99fd64b721b331735223b86342f54442007ee371f0a94646f835997446cc99e857b3cd23429639bf47af8fe42bad2e')

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
