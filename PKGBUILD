# Maintainer: Moritz Bunkus <mo@bunkus.online>

pkgname="perl-authen-oath"
pkgver="3.000001"
pkgrel='1'
pkgdesc="OATH One Time Passwords"
url="https://metacpan.org/pod/Authen::OATH"
license=("Artistic-2.0")
arch=('any')
depends=(
  "perl"
  "perl-digest-hmac"
  "perl-module-runtime"
  "perl-moo>=2.002004"
  "perl-type-tiny"
)
makedepends=(
  "perl-test-needs"
)
source=("https://cpan.metacpan.org/authors/id/O/OA/OALDERS/Authen-OATH-${pkgver}.tar.gz")
sha256sums=('b6944cd877848ba9e7c3d3920e946c1f99703d926ca1447ec114ce42545826c8')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Authen-OATH-${pkgver}"
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
