# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: mmirate
# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

set -u
_perlmod='Data-Walk'
_modnamespace="${_perlmod%%-*}"
pkgname="perl-${_perlmod,,}"
pkgver='2.01'
pkgrel='1'
pkgdesc="Perl CPAN ${_perlmod//-/::} - Traverse Perl data structures."
arch=('any')
url="https://metacpan.org/release/${_perlmod}"
license=('PerlArtistic' 'GPL')
depends=('perl')
options=('!emptydirs')
_verwatch=("http://www.cpan.org/modules/by-module/${_modnamespace}/" "${_perlmod}-\([0-9\.]*\)\.tar\.gz" 'l')
_srcdir="${_perlmod}-${pkgver}"
source=("${_verwatch[0]}${_perlmod}-${pkgver}.tar.gz")
md5sums=('d47b791549d4531bc1f2156b0fbeb749')
sha256sums=('88461561839fcbfebe1121cebee9bade20e609a12f8c7cb386eac22c8c54334a')
sha512sums=('ae8bd703fe82165ae63d9b3d5ba2044a3b5ef8b911cb60db17d2be12d49fcf218a5f31b11316aab0ec17925a84cc20dab599d4f9757d21ed19797cccbcf4a95a')

build() {
  set -u
  cd "${_srcdir}"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl 'Makefile.PL' INSTALLDIRS='vendor'
  make
  set +u
}

check() {
  set -u
  cd "${_srcdir}"
  make test
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make install DESTDIR="${pkgdir}"
  find "${pkgdir}" '(' -name '.packlist' -o -name 'perllocal.pod' ')' -delete
  set +u
}
set +u

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
