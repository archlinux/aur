# Maintainer: Damien Molinier <damien-43\N{COMMERCIAL AT}gmx.fr>

_distname="Array-Columnize"

pkgname=perl-array-columnize
pkgver=1.04
pkgrel=2
pkgdesc="Perl/CPAN Module ${_distname//-/::}"
arch=('any')
license=('PerlArtistic')
depends=('perl' 'perl-rlib')
makedepends=('perl-module-build')
options=('!emptydirs')
url="https://metacpan.org/release/${_distname}"
source=("https://cpan.metacpan.org/authors/id/R/RO/ROCKY/${_distname}-${pkgver}.tar.gz")
sha512sums=('72db7375f3e7365c432618aef79feeeacc84347aeeb136650914e380400237c3254b0413ab6ae7da75e25a40910c97fc490457ec86871511352026fcbfc4cbd1')

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
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  ./Build test
}

package() {
  cd "${srcdir}/${_distname}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  ./Build install --installdirs vendor --destdir "$pkgdir"
  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

# vim:set ts=2 sw=2 et:
