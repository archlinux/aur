# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=perl-ipc-signal
pkgver="1.00"
pkgrel="1"
pkgdesc="utility functions dealing with signals"
arch=('any')
url="http://search.cpan.org/dist/IPC-Signal"
license=('none')
depends=('perl')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/R/RO/ROSCH/IPC-Signal-${pkgver}.tar.gz")
sha512sums=('31ee15a55539546532cb8deb9bd379e0014b526fcd79ac20dc53591391b0fb50b182f6f653837bc230debb1779418316b7ac8e389224ad41a0aa3a380c76f229')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/IPC-Signal-${pkgver}"
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
