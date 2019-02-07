# Maintainer: Damien Molinier <damien-43\N{COMMERCIAL AT}gmx.fr>

_distname='B-DeparseTree'

pkgname=perl-b-deparsetree
pkgver=3.4.0
pkgrel=2
pkgdesc="Perl/CPAN Module ${_distname//-/::}"
arch=('any')
license=('GPL')
url="https://metacpan.org/release/${_distname}"
depends=('perl'
         'perl-rlib'
         'perl-data-printer')
makedepends=('perl-module-build'
             'perl-text-diff')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/R/RO/ROCKY/${_distname}-v${pkgver}.tar.gz")
sha512sums=('96a909d56ad5e04fb483f93ee6443348b0dd8145150fe3e2f15d5319f91f4dd35429019fb7f0a7e1542815c99c87f05b88d6c8d6c4225395d2668dcff3addd9c')

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
