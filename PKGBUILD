# Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-config-any'
pkgver='0.27'
pkgrel='1'
pkgdesc="Load configuration from different file formats, transparently"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-module-pluggable')
makedepends=('perl-xml-libxml')
url='http://search.cpan.org/dist/Config-Any'
source=("https://cpan.metacpan.org/authors/id/B/BR/BRICAS/Config-Any-${pkgver}.tar.gz")
sha512sums=('3987ab9521e5dc00f12b20f2cf3fb3ddb2fe1275903009064c6d5a29b1e5acfedde1238b9a60f0266a38c70a010fe26b4d29e4e8bccd11a01a19f28fa63625d2')

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
