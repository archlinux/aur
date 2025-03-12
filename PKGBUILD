# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-exporter-lite'
pkgver='0.09'
pkgrel='4'
pkgdesc="lightweight exporting of functions and variables"
arch=('any')
license=('Artistic-2.0')
options=('!emptydirs')
depends=('perl')
url='https://metacpan.org/release/Exporter-Lite'
source=("https://cpan.metacpan.org/authors/id/N/NE/NEILB/Exporter-Lite-${pkgver}.tar.gz")
sha512sums=('fa540b0aba6178031d0448cdd92bdf21226facd0424ca00329eac8b93086f7e53b9f37daf52a53a74b65fa6afe2b2aa236165d4c44e96d63aad19e0764924f92')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Exporter-Lite-${pkgver}"
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
