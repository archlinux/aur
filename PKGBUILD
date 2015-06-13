# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=perl-eval-linenumbers
pkgver=0.34
pkgrel="2"
pkgdesc="Add line numbers to hereis blocks that contain perl source code"
arch=('any')
url="http://search.cpan.org/dist/Eval-LineNumbers"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/M/MU/MUIR/modules/Eval-LineNumbers-$pkgver.tar.gz")
md5sums=('dc78f98c8de437a8cad2cd4236df68ed')
sha512sums=('db99b5c431c634142d6f0e030c332285ad8d40fbece7b12a57524d24e6fca6039203648a6112c065196ff2b85f031bc527ad444dbc4e369d2d65832744b7a053')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Eval-LineNumbers-${pkgver}"
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
