# Maintainer: Moritz Bunkus <moritz@bunkus.org>

# Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-net-sip'
pkgver='0.811'
pkgrel='1'
pkgdesc="SIP (Voice Over IP, RFC3261) packet handling"
arch=('any')
license=('PerlArtistic')
options=('!emptydirs')
depends=('perl-net-dns')
url='http://search.cpan.org/dist/Net-SIP'
source=("https://cpan.metacpan.org/authors/id/S/SU/SULLR/Net-SIP-${pkgver}.tar.gz")
sha512sums=('ef7150c9ef3b44b4036055c859abc93706595c4afd1f53f9ba819021282425b1eae6fa5a61802b406126c9b5ed1929762468abcec5a98eadd04380a516e1db65')

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
