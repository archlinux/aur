pkgname=perl-datetime-format-pg
pkgver="0.16012"
pkgrel="1"
pkgdesc="'Parse and format PostgreSQL dates and times'"
arch=(i686 x86_64)
license=('perl')
url="http://search.cpan.org/~dmaki/DateTime-Format-Pg"
options=(!emptydirs)
depends=('perl-datetime-format-builder>=0.72' 'perl-datetime-timezone>=0.05' 'perl-datetime>=0.10')
makedepends=('perl-module-build')
source=("https://cpan.metacpan.org/authors/id/D/DM/DMAKI/DateTime-Format-Pg-${pkgver}.tar.gz")
md5sums=('cf82f93a58ad3ef043e5186daf2d1df4')
sha512sums=('8c0409ab3f054328f26169d1179756dff51ab0d51b09a2a2b7941d536795928545bf4e8c4c23f6fb085c7e718a628f4f0f4bde6719dc1173eeff8a3166cdb0ff')

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
