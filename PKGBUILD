# lMaintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-cpan-meta-check'
pkgver='0.009'
pkgrel="1"
pkgdesc="Verify requirements in a CPAN::Meta object"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-test-deep')
url='http://search.cpan.org/dist/CPAN-Meta-Check'
source=("http://cpan.metacpan.org/authors/id/L/LE/LEONT/CPAN-Meta-Check-${pkgver}.tar.gz")
md5sums=('d08a8701fb1e63ad5e460cb2f8da2af7')
sha512sums=('affbc654c4548d028ce84179947bd43f367e7078e415071e2f3a34354f1f379b994ce289c828a0e3c51295cabfeb4cd8fa3087b903396b6bb203ddabae0361c5')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/CPAN-Meta-Check-${pkgver}"
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
