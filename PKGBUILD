# Maintainer: Damien Molinier <damien-43\N{COMMERCIAL AT}gmx.fr>

_distname="Marpa-R2"

pkgname=perl-marpa-r2
pkgver=8.000000
pkgrel=1
pkgdesc="Perl/CPAN Module ${_distname//-/::}"
arch=('x86_64' 'i686')
license=('LGPL')
options=('!emptydirs')
depends=('perl'
         'perl-ppi'
         'perl-html-parser')
makedepends=('perl-module-build')
url="https://metacpan.org/release/${_distname}"
source=("https://cpan.metacpan.org/authors/id/J/JK/JKEGL/${_distname}-${pkgver}.tar.gz")
sha512sums=('1e38c9bb4677f4eededce5e0b2e7640380b8643a7a7a4b59a2ba03cd8b72cfa4bd4eff893fc2e3b1b0d242f60ab2854bed0fbea736cac8b4beb866ac97e088f9')

prepare() {
  cd "${srcdir}/${_distname}-${pkgver}"
}

build() {
  cd "${srcdir}/${_distname}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT='1' PERL_AUTOINSTALL='--skipdeps' MODULEBUILDRC='/dev/null'
  perl Build.PL
  ./Build
}

check() {
  cd "${srcdir}/${_distname}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT='1'
  ./Build test
}

package() {
  cd "${srcdir}/${_distname}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  ./Build install --installdirs vendor --destdir "${pkgdir}"
  find "${pkgdir}" \( -name .packlist -o -name perllocal.pod \) -delete
}

# vim:set ts=2 sw=2 et:
