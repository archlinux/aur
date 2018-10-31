# Maintainer: Damien Molinier <damien-43\N{COMMERCIAL AT}gmx.fr>

_distname='Unicode-EastAsianWidth'

pkgname=perl-unicode-eastasianwidth
pkgver=1.33
pkgrel=1
pkgdesc="Perl/CPAN Module ${_distname//-/::}"
arch=('any')
license=('custom:CC0')
url="https://metacpan.org/release/${_distname}"
depends=('perl')
options=(!emptydirs)
source=("https://cpan.metacpan.org/authors/id/A/AU/AUDREYT/${_distname}-${pkgver}.tar.gz")
sha512sums=('c21e988f460534b370954d0448daec5bfb0a34ec816459f8422943ebe44ff17b5acb8a423d69daba81599111d7fa4aa33a3598e0ea4614eed25a587c1f5690eb')

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
