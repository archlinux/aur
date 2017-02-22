# Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-config-any'
pkgver='0.28'
pkgrel='1'
pkgdesc="Load configuration from different file formats, transparently"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-module-pluggable')
makedepends=('perl-xml-libxml')
url='http://search.cpan.org/dist/Config-Any'
source=("https://cpan.metacpan.org/authors/id/H/HA/HAARG/Config-Any-${pkgver}.tar.gz")
sha512sums=('fd2d65a12e826802231ea8f9b0cfd0b55b5da02fea385b5a5d190338617fc076d9bc36a85408088a9cc9394f61c4d02bfbc0ae2b002610ad9e764b402322cf42')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Config-Any-${pkgver}"
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
