pkgname=perl-datetime-format-pg
pkgver="0.16010"
pkgrel="1"
pkgdesc="'Parse and format PostgreSQL dates and times'"
arch=(i686 x86_64)
license=('perl')
url="http://search.cpan.org/~dmaki/DateTime-Format-Pg"
options=(!emptydirs)
depends=('perl-datetime-format-builder>=0.72' 'perl-datetime-timezone>=0.05' 'perl-datetime>=0.10')
source=("http://cpan.metacpan.org/authors/id/D/DM/DMAKI/DateTime-Format-Pg-${pkgver}.tar.gz")
md5sums=('776d8f64f48e2bebe34f80383a032ede')
sha512sums=('a7b2e7d28627d1d5abbf37e4a47321d497b95147aa6fd6be9b39de20c62e931ef5a5aed7c77bf5b02d82ab821436b77acad34c77f786f7c16403ba01405d1264')

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
