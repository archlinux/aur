# Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-net-ipaddress-util'
pkgver='4.001'
pkgrel='1'
pkgdesc='Version-agnostic representation of an IP address'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-list-moreutils')
url='http://search.cpan.org/dist/Net-IPAddress-Util'
source=("https://cpan.metacpan.org/authors/id/P/PW/PWBENNETT/Net-IPAddress-Util-${pkgver}.tar.gz")
sha512sums=('984303e7f682180126d69f261e51e5f773c5505df0ad270e708bc7e31a4e53059d70d3daf3d739ca6e47473cf1893578bf992e4e1360b22aab6002dc1ad010cc')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Net-IPAddress-Util-${pkgver}"
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
