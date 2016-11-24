# Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-net-sip'
pkgver='0.801'
pkgrel='1'
pkgdesc="SIP (Voice Over IP, RFC3261) packet handling"
arch=('any')
license=('PerlArtistic')
options=('!emptydirs')
depends=('perl-net-dns')
url='http://search.cpan.org/dist/Net-SIP'
source=("https://cpan.metacpan.org/authors/id/S/SU/SULLR/Net-SIP-${pkgver}.tar.gz")
sha512sums=('0c285e7e80b2b3f847e697d9386bd0f0fac0eed90081b03bafe6669be961f0e7d162ce976ebd6a804876cfefa1fb3cf5c5c59c74a912428f08a65f5057f34581')

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
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
