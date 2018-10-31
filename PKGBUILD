# Maintainer: Damien Molinier <damien-43\N{COMMERCIAL AT}gmx.fr>

_distname='Text-VisualWidth-PP'

pkgname=perl-text-visualwidth-pp
pkgver=0.05
pkgrel=1
pkgdesc="Perl/CPAN Module ${_distname//-/::}"
arch=('any')
license=('GPL' 'PerlArtistic')
url="https://metacpan.org/release/${_distname}"
depends=('perl'
         'perl-unicode-eastasianwidth')
makedepends=('perl-module-build')
options=(!emptydirs)
source=("https://cpan.metacpan.org/authors/id/T/TO/TOKUHIROM/${_distname}-${pkgver}.tar.gz")
sha512sums=('94150564048681fc526b4aa0f186abec84b86b0d3a06868a13f4a19ec4baa90f0442f2d2d70a9a60faec3bdd90bcc6e9dbec84dcba2e485d577f16173852fe86')

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
