# Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-config-any'
pkgver='0.26'
pkgrel='2'
pkgdesc="Load configuration from different file formats, transparently"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-module-pluggable')
makedepends=('perl-xml-libxml')
url='http://search.cpan.org/dist/Config-Any'
source=("https://cpan.metacpan.org/authors/id/B/BR/BRICAS/Config-Any-${pkgver}.tar.gz")
md5sums=('5c5ac3e32674a98681da85a56424847a')
sha512sums=('15bac8e71340b181dd195ae211add730d8be01fcd7bbf4a7d3ed10b7fd2d7f207501a88a6ed03999d7207672249c4045defc931b7e9eb56e00166fdf7daccfda')

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
