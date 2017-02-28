# Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-config-any'
pkgver='0.29'
pkgrel='1'
pkgdesc="Load configuration from different file formats, transparently"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-module-pluggable>=3.6')
makedepends=('perl-xml-libxml')
url='http://search.cpan.org/dist/Config-Any'
source=("https://cpan.metacpan.org/authors/id/H/HA/HAARG/Config-Any-${pkgver}.tar.gz")
sha512sums=('4c9e9aeca0e21ab50a26ed319298430f95783e5f93577cac59da1d791334c9bcc8d4c19194080697fad2be99b0b426a538196a8a9de2f6eec5a5a015d00f9cbb')

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
