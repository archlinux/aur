# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname="perl-cache-memcached-fast"
pkgver="0.23"
pkgrel="1"
pkgdesc="Perl client for memcached, in C language"
arch=('any')
url="http://search.cpan.org/dist/Cache-Memcached-Fast"
license=('PerlArtistic')
depends=('perl')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/K/KR/KROKI/Cache-Memcached-Fast-${pkgver}.tar.gz")
sha512sums=('2023eaec65da3ad8ac48907f86dd2f6a679939659a0047c46654aafaf3aceefcd0e03aee340214aa4300a0f4469da74b646a7a1f2c99ea9dcc6e3438f5d7899e')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Cache-Memcached-Fast-${pkgver}"
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
