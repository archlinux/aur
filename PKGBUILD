# Maintainer: Damien Molinier <damien-43\N{COMMERCIAL AT}gmx.fr>

_distname='Unicode-EastAsianWidth'

pkgname=perl-unicode-eastasianwidth
pkgver=1.40
pkgrel=1
pkgdesc="Perl/CPAN Module ${_distname//-/::}"
arch=('any')
license=('custom:CC0')
url="https://metacpan.org/release/${_distname}"
depends=('perl')
options=(!emptydirs)
source=("https://cpan.metacpan.org/authors/id/A/AU/AUDREYT/${_distname}-${pkgver}.tar.gz")
sha512sums=('a8eb27605020ef78e8ab281922501a06ba94e275ca705c098810468a737796e73932cb9ae43cf46abd45c1847d33622cbcfa0ff3d86bc5213c14d0b151cf6dc3')

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
