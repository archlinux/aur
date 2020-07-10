# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname="perl-hash-merge"
pkgver="0.301"
pkgrel="1"
pkgdesc="Merges arbitrarily deep hashes into a single hash"
arch=("any")
license=("PerlArtistic" "GPL")
options=("!emptydirs")
depends=("perl-clone-choose>=0.008" "perl-scalar-list-utils")
url="http://search.cpan.org/dist/Hash-Merge"
source=("https://cpan.metacpan.org/authors/id/H/HE/HERMES/Hash-Merge-${pkgver}.tar.gz")
sha512sums=('f608e7fde305b5f97b393697dfbe029425862b89416b34338f22b05c548f86bf5fcfc16d0246e00054b324ade60392ee8c0e5a12e5ee6d38a12dca662e67fec2')

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
