# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=perl-datetime-format-pg
pkgver="0.16013"
pkgrel='2'
pkgdesc="'Parse and format PostgreSQL dates and times'"
arch=(i686 x86_64)
license=('perl')
url="http://search.cpan.org/~dmaki/DateTime-Format-Pg"
options=(!emptydirs)
depends=('perl-datetime-format-builder>=0.72' 'perl-datetime-timezone>=0.05' 'perl-datetime>=0.10')
makedepends=('perl-module-build-tiny>=0.035')
source=("https://cpan.metacpan.org/authors/id/D/DM/DMAKI/DateTime-Format-Pg-${pkgver}.tar.gz")
md5sums=('3efba801b60d6700b68666282e8b539f')
sha512sums=('fbfe1727d042be18cdd308c723cb6e2f69bba0403839083bef405f53068fed32e8c5171cbc72b62c927a89265d907455b251336519878cfdea7912555460e520')

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
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}
