# Maintainer: Damien Molinier <damien-43\N{COMMERCIAL AT}gmx.fr>

_distname='Unicode-EastAsianWidth'

pkgname=perl-unicode-eastasianwidth
pkgver=12.0
pkgrel=1
pkgdesc="Perl/CPAN Module ${_distname//-/::}"
arch=('any')
license=('custom:CC0')
url="https://metacpan.org/release/${_distname}"
depends=('perl')
options=(!emptydirs)
source=("https://cpan.metacpan.org/authors/id/A/AU/AUDREYT/${_distname}-${pkgver}.tar.gz")
sha512sums=('ec11d12b86d9e3676cf612c40f8e75ce1efdd302b5a6fe5d594306cffcf94f91855b5ee979f7646762605453d08d4b6b47f556e56f01b47d8ca1da8455dc138d')

build() {
  cd "${srcdir}/${_distname}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT='1' PERL_AUTOINSTALL='--skipdeps'

  perl -I. Makefile.PL INSTALLDIRS=vendor

  make
}

check () {
  cd "${srcdir}/${_distname}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT='1'
  make test
}

package() {
  cd "${srcdir}/${_distname}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT

  make install DESTDIR="$pkgdir"

  find "${pkgdir}" \( -name perllocal.pod -or -name .packlist \) -delete
}

# vim:set ts=2 sw=2 et:
