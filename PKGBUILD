# Maintainer: Damien Molinier <damien-43\N{COMMERCIAL AT}gmx.fr>

_distname="Marpa-R2"

pkgname=perl-marpa-r2
pkgver=12.000000
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
sha512sums=('9070325142dda74bbcfb6d903c3cd3774f45c3267c5070916bb737ae2beafc6fbb5ae45acc43b399f2b5beb122b08ff2e198bf8b1d460645e31b91ec0c6a9a76')

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
