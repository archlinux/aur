# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname="perl-net-sip"
pkgver="0.813"
pkgrel="1"
pkgdesc="SIP (Voice Over IP, RFC3261) packet handling"
arch=("any")
license=("PerlArtistic")
options=("!emptydirs")
depends=("perl-net-dns")
url="http://search.cpan.org/dist/Net-SIP"
source=("https://cpan.metacpan.org/authors/id/S/SU/SULLR/Net-SIP-${pkgver}.tar.gz")
sha512sums=('74b57b0da0e8c31b2815ed95d866c727bae8764d2dba231f1fa20c3c041d94a2cf1956b500127600478450967e086b16deaea44a25bec90002ad7041784e8e92')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Net-SIP-${pkgver}"
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
