# Maintainer: xRemaLx <anton.komolov@gmail.com>
# Contributor: AUR Perl <aurperl@juster.info>

pkgname='perl-carp-assert'
pkgver='0.21'
pkgrel='1'
pkgdesc="executable comments"
_dist='Carp-Assert'
arch=('any')
url='http://search.cpan.org/dist/Carp-Assert'
license=('PerlArtistic' 'GPL')
depends=('perl')
options=('!emptydirs' purge)
makedepends=()
checkdepends=()
provides=("Carp::Assert=${pkgver}" "perl-carp-assert=${pkgver}")
source=("http://search.cpan.org/CPAN/authors/id/N/NE/NEILB/${_dist}-${pkgver}.tar.gz")
sha512sums=('9fb96ebaf03a86edcd0262b5216b345839dc99e504738e52f883932e425cac33470fcb0e8e4653488c0d8e63e9904af311056213c63ae40bc3935eec4c0410a0')

sanitize() {
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
}

build() {
  cd "${srcdir}/${_dist}-${pkgver}"
  sanitize
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "${srcdir}/${_dist}-${pkgver}"
  sanitize
  make test
}

package() {
  cd "${srcdir}/${_dist}-${pkgver}"
  sanitize
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
