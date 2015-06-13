pkgname=perl-getopt-mixed
pkgver=1.12
pkgrel="2"
pkgdesc="Library for getopt processing with both long and short options"
arch=('any')
url="http://search.cpan.org/~cjm/Getopt-Mixed/"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/C/CJ/CJM/Getopt-Mixed-$pkgver.tar.gz)
md5sums=('124360ea13bb6ccebeadc3e3a7fcdd59')
sha512sums=('74e7d0e7cf854d18b69cf36caf9647f78660db1b21ceb6750aae15aec5e40947902834d7f178adeae442f83958157809a2f95f1873c120dc3093c35d1fdc0ad2')


prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Getopt-Mixed-${pkgver}"
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
