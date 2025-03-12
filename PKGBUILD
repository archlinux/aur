# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=perl-datetime-format-pg
pkgver="0.16014"
pkgrel='3'
pkgdesc="'Parse and format PostgreSQL dates and times'"
arch=("any")
license=('GPL-1.0-or-later' 'Artistic-2.0')
url="https://metacpan.org/dist/DateTime-Format-Pg"
options=(!emptydirs)
depends=('perl-datetime-format-builder>=0.72' 'perl-datetime-timezone>=0.05' 'perl-datetime>=0.10')
makedepends=('perl-module-build-tiny>=0.035')
source=("https://cpan.metacpan.org/authors/id/D/DM/DMAKI/DateTime-Format-Pg-${pkgver}.tar.gz")
md5sums=('bd09f6ca42e9010dfdee6640321cc788')
sha512sums=('ff0072cac10b4457297bea958eb25c65b2d8d278257e26e3b0d12f290093ae14bb98dda7c8632562d4d45b02a2834438b93d0c6df802759938dd21b7151a8a9c')

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
