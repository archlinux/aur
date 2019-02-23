# Maintainer: Moritz Bunkus <moritz@bunkus.org>
pkgname='perl-lwp-useragent-cached'
pkgver='0.07'
pkgrel='1'
pkgdesc="LWP::UserAgent with simple caching mechanism"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-libwww')
makedepends=('perl-test-mock-lwp-dispatch>=0.02')
url='https://metacpan.org/release/LWP-UserAgent-Cached'
source=("https://cpan.metacpan.org/authors/id/O/OL/OLEG/LWP-UserAgent-Cached-${pkgver}.tar.gz")
sha512sums=('1a83d6b8125d3312aae1a7d49ad231a4ffd5e3a0ea4421f0c2679efad2874ab537eb33fdb3814e3bc5b856b1b88262004ca076a9e84d5e2bb34ea396e0a79d54')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  cd "${srcdir}/LWP-UserAgent-Cached-${pkgver}"
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
