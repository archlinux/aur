# Maintainer: Moritz Bunkus <mo@bunkus.online>

pkgname="perl-authen-oath"
pkgver="2.0.1"
pkgrel="3"
pkgdesc="OATH One Time Passwords"
url="https://metacpan.org/pod/Authen::OATH"
license=("GPL")
arch=('any')
depends=(
  "perl"
  "perl-digest-hmac"
  "perl-moo>=2.002004"
  "perl-type-tiny"
)
makedepends=(
  "perl-test-needs"
)
source=("https://cpan.metacpan.org/authors/id/O/OA/OALDERS/Authen-OATH-${pkgver}.tar.gz")
sha256sums=('1a813dbdc05c3fbd9dd39dbcfd85e2cfb0ba3d0f652cf6b26ec83ab8146ddc77')

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
