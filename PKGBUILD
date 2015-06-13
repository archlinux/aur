# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=perl-rose-datetime
pkgver=0.540
pkgrel="2"
pkgdesc="DateTime helper functions and objects"
arch=(any)
license=('PerlArtistic')
url="http://search.cpan.org/dist/Rose-DateTime/"
depends=('perl-datetime' 'perl-rose-object>=0.82')
makedepends=(perl-test-pod)
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/J/JS/JSIRACUSA/Rose-DateTime-${pkgver}.tar.gz)
md5sums=('dd59316348ecf9827d432369242547bf')
sha512sums=('804c4cee4ef2c8acf569e79dde040f8316bd3d3b88e7de2e61d66d1bb6cbddc67becd16424cbab216bd274eead306a14d1f009e9a066def3c77fe527c3926b4a')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  cd "${srcdir}/Rose-DateTime-${pkgver}"
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
