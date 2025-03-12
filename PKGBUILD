# Maintainer: Moritz Bunkus <moritz@bunkus.org>

# Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-net-ipaddress-util'
pkgver='5.001'
pkgrel='2'
pkgdesc='Version-agnostic representation of an IP address'
arch=('any')
license=('Artistic-2.0')
options=('!emptydirs')
depends=('perl-list-moreutils')
url='https://metacpan.org/dist/Net-IPAddress-Util'
source=("https://cpan.metacpan.org/authors/id/P/PW/PWBENNETT/Net-IPAddress-Util-${pkgver}.tar.gz")
sha512sums=('9aaa0513f9632635843f4c4aec28cbf5e38dd01e0bea4ddc91a859f0bea960eca19a8a3530582a9fe98f53f3936812e096b94ea65e5135245d06cf4fe2b6c331')

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
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
