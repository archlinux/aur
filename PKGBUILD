# Maintainer: Moritz Bunkus <moritz@bunkus.org>

# Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-config-any'
pkgver='0.32'
pkgrel='1'
pkgdesc="Load configuration from different file formats, transparently"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-module-pluggable>=3.6')
url='http://search.cpan.org/dist/Config-Any'
source=("https://cpan.metacpan.org/authors/id/H/HA/HAARG/Config-Any-${pkgver}.tar.gz")
sha512sums=('7c6fa9f341b1392ffd71babca688e3fb8bcd5f6330fe15aefb36ac002af83ed3674667dcddd9a500404bc4e019609f392c173653a8a792267fdb609e9323116c')

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
