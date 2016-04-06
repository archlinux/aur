# Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-net-ipaddress-util'
pkgver='3.025'
pkgrel='1'
pkgdesc='Version-agnostic representation of an IP address'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-list-moreutils')
url='http://search.cpan.org/dist/Net-IPAddress-Util'
source=("https://cpan.metacpan.org/authors/id/P/PW/PWBENNETT/Net-IPAddress-Util-${pkgver}.tar.gz")
md5sums=('c1edd78618aa345ebe744c0a09dca173')
sha512sums=('98027ef6a9f1d6806ca7d35b5d20dce9613a2d8170408768b109a52448752ad8953cabaf5f38c7314c1418aa2852162fb2e136c6cf05efd914e2ad7e08f1de24')

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
