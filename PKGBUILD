# Maintainer: Moritz Bunkus <moritz@bunkus.org>

# Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-net-ipaddress-util'
pkgver='4.004'
pkgrel='1'
pkgdesc='Version-agnostic representation of an IP address'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-list-moreutils')
url='http://search.cpan.org/dist/Net-IPAddress-Util'
source=("https://cpan.metacpan.org/authors/id/P/PW/PWBENNETT/Net-IPAddress-Util-${pkgver}.tar.gz")
sha512sums=('a05d9440fbf94d19b9cfdb44b69edbc2e23bfd453b344d24e539362a2aca72095d421bf74a53d8e24aaf900181ecd1d0fef4f73d4ecd85d2e7eed0cdc4af533c')

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
