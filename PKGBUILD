# Maintainer: Moritz Bunkus <moritz@bunkus.org>

# Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-context-preserve'
pkgver='0.02'
pkgrel='1'
pkgdesc="run code after a subroutine call, preserving the context the subroutine would have seen if it were the last statement in the caller"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
makedepends=('perl-test-exception')
url='http://search.cpan.org/dist/Context-Preserve'
source=("https://cpan.metacpan.org/authors/id/E/ET/ETHER/Context-Preserve-${pkgver}.tar.gz")
sha512sums=('e5c230e38430c6ea9b7ed75e075a12454262adf1883e5ab6ada4696099e2f246d0f9b613934b4197b0529e126ea083d12d9bbe4ece5cfb82a93f913b7d70b068')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Context-Preserve-${pkgver}"
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
