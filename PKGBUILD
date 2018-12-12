# Maintainer: Damien Molinier <damien-43\N{COMMERCIAL AT}gmx.fr>

_distname="Marpa-R2"

pkgname=perl-marpa-r2
pkgver=6.000000
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
sha512sums=('a2693c4cd4030405817a7fc0ec7e62cb2e941198975ce0309c0ca9300aa162555ad11b9fac3380bcb12e1d94cbdd6022515a2b244f383b06360ee034772b4f42')

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
