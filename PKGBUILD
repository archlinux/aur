# Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-net-ipaddress-util'
pkgver='3.027'
pkgrel='1'
pkgdesc='Version-agnostic representation of an IP address'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-list-moreutils')
url='http://search.cpan.org/dist/Net-IPAddress-Util'
source=("https://cpan.metacpan.org/authors/id/P/PW/PWBENNETT/Net-IPAddress-Util-${pkgver}.tar.gz")
sha512sums=('26654cfe734abefb3dffe7fc3053057fb4bc67d6bbe7f2fb695ba39f53cba9781ac03c33c37409ff85acf58a7744c584f5a0518e6e7c8d799f05fff431297802')

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
