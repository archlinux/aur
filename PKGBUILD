# Maintainer: Damien Molinier <damien-43\N{COMMERCIAL AT}gmx.fr>

_distname="Marpa-R2"

pkgname=perl-marpa-r2
pkgver=4.000000
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
sha512sums=('962370df30de5af11720a2268dcae6ffa12db8a7f58ad26885963c5472e0c2a2b65f693a475c645fda29376f964a9730ad74ea5041e380b3af616be724c6e286')

prepare() {
  cd "${srcdir}/${_distname}-${pkgver}"
}

build() {
  cd "${srcdir}/${_distname}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT='1' PERL_AUTOINSTALL='--skipdeps'
  perl Build.PL
  ./Build
}

check() {
  cd "${srcdir}/${_distname}-${pkgver}"
  ./Build test
}

package() {
  cd "${srcdir}/${_distname}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  ./Build install --installdirs vendor --destdir "${pkgdir}"
  find "${pkgdir}" \( -name .packlist -o -name perllocal.pod \) -delete
}

# vim:set ts=2 sw=2 et:
