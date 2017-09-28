# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname="perl-gd-barcode"
pkgver="1.15"
pkgrel='2'
pkgdesc="Create barcode image with GD"
arch=('any')
url="http://search.cpan.org/dist/GD-Barcode"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-gd')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/K/KW/KWITKNR/GD-Barcode-${pkgver}.tar.gz")
sha512sums=('3128ef0376f2d31b55bdf9e206a16982632a7e7e7eae6d0d846fe0f80f3998a893f22f910a7d053e15b9fd94a9408805a7b862d735e6be03e1fcb9ff7d4d5155')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/GD-Barcode-${pkgver}"
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
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
