# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=perl-proc-waitstat
pkgver="1.00"
pkgrel="1"
pkgdesc="interpret and act on wait() status values"
arch=('any')
url="http://search.cpan.org/dist/Daemon-Generic"
license=('none')
depends=('perl' 'perl-ipc-signal')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/R/RO/ROSCH/Proc-WaitStat-${pkgver}.tar.gz")
sha512sums=('7abc1c3771ec560e6138cc7709ca4527a34c897067e13afd57d096d664d6d11a1d80898a955404d8b583972eae8c80689fd8421adaee9bed2601e47afe9ef235')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Proc-WaitStat-${pkgver}"
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
