# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname="perl-clone-pp"
pkgver="1.08"
pkgrel='3'
pkgdesc='Clone::PP - Recursively copy Perl datatypes'
arch=('any')
url="https://metacpan.org/pod/Clone::PP"
license=('Artistic-2.0')
groups=()
depends=("perl")
makedepends=()
provides=()
conflicts=()
replaces=()
options=("!emptydirs")
source=("https://cpan.metacpan.org/authors/id/N/NE/NEILB/Clone-PP-${pkgver}.tar.gz")
sha256sums=('57203094a5d8574b6a00951e8f2399b666f4e74f9511d9c9fb5b453d5d11f578')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Clone-PP-${pkgver}"
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
