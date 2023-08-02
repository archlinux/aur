# Maintainer: Damien Molinier <damien-43\N{COMMERCIAL AT}gmx.fr>

_distname='Unicode-EastAsianWidth-Detect'

pkgname=perl-unicode-eastasianwidth-detect
pkgver=0.03
pkgrel=1
pkgdesc="Perl/CPAN Module ${_distname//-/::}"
arch=('any')
license=('GPL' 'PerlArtistic')
url="https://metacpan.org/release/${_distname}"
depends=('perl')
makedepends=('perl-module-build')
options=(!emptydirs)
source=("https://cpan.metacpan.org/authors/id/M/MA/MATTN/${_distname}-${pkgver}.tar.gz")
sha512sums=('28231286878980a155bb5727a3021825fa4f455cddd0b2b8304e669a9b8eb95e9aae83d36abaa79a5ca129d9a90858963183dc08ca6b7a069a3308f8714e9073')

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
