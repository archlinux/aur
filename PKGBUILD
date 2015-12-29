pkgname=perl-datetime-format-pg
pkgver="0.16011"
pkgrel="2"
pkgdesc="'Parse and format PostgreSQL dates and times'"
arch=(i686 x86_64)
license=('perl')
url="http://search.cpan.org/~dmaki/DateTime-Format-Pg"
options=(!emptydirs)
depends=('perl-datetime-format-builder>=0.72' 'perl-datetime-timezone>=0.05' 'perl-datetime>=0.10')
makedepends=('perl-module-build')
source=("https://cpan.metacpan.org/authors/id/D/DM/DMAKI/DateTime-Format-Pg-${pkgver}.tar.gz")
md5sums=('8e462e583bd4b51b30255f522e887932')
sha512sums=('6f5d6c6c8160b38dec2fc5edcb8113c1747f8a7caacc385b55da9e71e7ce083a48177c7f64fd20cc6f2e9878dda9069517ba3f71ef889d691d14d5fd6bf8637f')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/DateTime-Format-Pg-${pkgver}"
}

build() {
  prepare_environment
  /usr/bin/perl Build.PL
  ./Build
}

check() {
  prepare_environment
  ./Build test
}

package() {
  prepare_environment
  ./Build install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
