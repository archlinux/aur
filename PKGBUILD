# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-jq'
pkgver='0.01'
pkgrel='3'
pkgdesc="Binding to Jq for querying and manipulating data"
arch=('any')
license=('Artistic-2.0' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl-json')
makedepends=()
url='https://metacpan.org/dist/Jq'
source=("https://cpan.metacpan.org/authors/id/I/IN/INGY/Jq-${pkgver}.tar.gz")
sha512sums=('3cad9f67c328aadf52467610d9ca915dc57e98c5d4f6425fe66814b9f42a5868ab42f0aa2349f1b0d7ea7b98905f25b090ea4432afa7d8292f3aac359be5d367')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Jq-${pkgver}"
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
