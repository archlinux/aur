# Maintainer: Damien Molinier <damien-43\N{COMMERCIAL AT}gmx.fr>

_distname='Text-VisualWidth-PP'

pkgname=perl-text-visualwidth-pp
pkgver=0.08
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
sha512sums=('2091fbe2d826a7d0afd1dab75a66eb8528bda06e7648196f43ca2dfbd9c4b8998c401f6d00d117358c158a49e8f241a06c391fb45fee0eb0dd0a680cc9fd723e')

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
