# Maintainer: Damien Molinier <damien-43\N{COMMERCIAL AT}gmx.fr>

_distname='Text-VisualWidth-PP'

pkgname=perl-text-visualwidth-pp
pkgver=0.09
pkgrel=1
pkgdesc="Perl/CPAN Module ${_distname//-/::}"
arch=('any')
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
url="https://metacpan.org/release/${_distname}"
depends=('perl'
         'perl-unicode-eastasianwidth')
makedepends=('perl-module-build-tiny')
options=(!emptydirs)
source=("https://cpan.metacpan.org/authors/id/T/TO/TOKUHIROM/${_distname}-${pkgver}.tar.gz")
sha512sums=('3e83cd637ddd8c573d1ea45d91a72cd7e1b3495e60c9b64be906b12bc1e0f9784f7dec59e421a47cf2ae0b959f13024dc8b10e629b4c0f7b6ee7fa950ad77923')

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
  find "${pkgdir}" \( -name perllocal.pod -or -name .packlist \) -delete
}

# vim:set ts=2 sw=2 et:
