# Maintainer: Damien Molinier <damien-43\N{COMMERCIAL AT}gmx.fr>

_distname='Devel-Trepan-Deparse'

pkgname=perl-devel-trepan-deparse
pkgver=3.1.0
pkgrel=1
pkgdesc='Adds deparse support via B::DeparseTree to Devel::Trepan'
arch=('any')
license=('GPL')
options=('!emptydirs')
depends=('perl'
         'perl-devel-trepan'
         'perl-b-deparsetree'
         'perl-data-printer'
         'perl-devel-callsite'
         'perl-rlib')
makedepends=('perl-module-build')
url="https://metacpan.org/release/${_distname}"
source=("https://cpan.metacpan.org/authors/id/R/RO/ROCKY/${_distname}-v${pkgver}.tar.gz")
sha512sums=('8c779c0f57d44a5bede592a8d0cb1d7b9fb7a9755c1c34cbde926ef7da2bdf5510bfb40632697edc804b021a490346bc1b72a38231fc8c2833cf842d9cc8b6cd')

prepare() {
  cd "${srcdir}/${_distname}-v${pkgver}"
}

build() {
  cd "${srcdir}/${_distname}-v${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT='1' PERL_AUTOINSTALL='--skipdeps' MODULEBUILDRC='/dev/null'
  perl Build.PL
  ./Build
}

check() {
  cd "${srcdir}/${_distname}-v${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT='1'
  ./Build test
}

package() {
  cd "${srcdir}/${_distname}-v${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  ./Build install --installdirs vendor --destdir "${pkgdir}"
  find "${pkgdir}" \( -name perllocal.pod -or -name .packlist \) -delete
}

# vim:set ts=2 sw=2 et:
