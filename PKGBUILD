# Maintainer: Damien Molinier <damien-43\N{COMMERCIAL AT}gmx.fr>

_distname='Text-VisualWidth-PP'

pkgname=perl-text-visualwidth-pp
pkgver=0.07
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
sha512sums=('49edf746da41a8f725229d3720e2d2d47783acde411aa28762d30a9b645239da7685c9e8b61b6ce6e101a290bcb71883169ecb0e96e1b98b9b4e20f36d2c82b1')

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
