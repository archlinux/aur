# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-time-period'
pkgver='1.25'
pkgrel='1'
pkgdesc="A Perl module to deal with time periods"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
url='http://search.cpan.org/dist/Time-Period/'
source=("https://cpan.metacpan.org/authors/id/P/PB/PBOYD/Time-Period-${pkgver}.tar.gz")
md5sums=('92f33afda0f440be7335a163ac246ab1')
sha512sums=('528dc8c31692da61170362df8d32c81d4811edfa8388752c82452e57f2349f9345b7ee4611c4cf48bfe7aae19cdad50513f9ce6347768be61970c507c0c0e98d')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Time-Period-${pkgver}"
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
