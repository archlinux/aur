# Maintainer: Moritz Bunkus <moritz@bunkus.org>

# Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-config-any'
pkgver='0.33'
pkgrel='3'
pkgdesc="Load configuration from different file formats, transparently"
arch=('any')
license=('Artistic-2.0' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl-module-pluggable>=3.6')
url='http://search.cpan.org/dist/Config-Any'
source=("https://cpan.metacpan.org/authors/id/H/HA/HAARG/Config-Any-${pkgver}.tar.gz")
sha512sums=('e521009f444fdd1459c3fbd740b41290bf3fd2296e8ae561d0f5f99cb4385129212e7c1818ac6d193cb5cc486a90b54f26592985e35f85d166e972268d0146eb')

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
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
