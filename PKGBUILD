# Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-net-sip'
pkgver='0.809'
pkgrel='1'
pkgdesc="SIP (Voice Over IP, RFC3261) packet handling"
arch=('any')
license=('PerlArtistic')
options=('!emptydirs')
depends=('perl-net-dns')
url='http://search.cpan.org/dist/Net-SIP'
source=("https://cpan.metacpan.org/authors/id/S/SU/SULLR/Net-SIP-${pkgver}.tar.gz")
sha512sums=('c1741bdf10fb0285ccdc4b453feb81329a30c370f46f2b134768908e6f714bb6db66d6b859da297b4246d0cc73a2959f5fbfc0657ef43dc115f01fef480f686a')

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
