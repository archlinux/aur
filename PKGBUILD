# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: mmirate
# Contributor: pshevtsov
# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

set -u
_perlmod='Text-Table'
_modnamespace="${_perlmod%%-*}"
pkgname="perl-${_perlmod,,}"
pkgver='1.133'
pkgrel='1'
pkgdesc="Perl CPAN ${_perlmod//-/::} - Organize Data in Tables"
arch=('any')
url="http://search.cpan.org/dist/${_perlmod}"
license=('PerlArtistic' 'GPL')
depends=('perl')
depends+=('perl-text-aligner>=0.05')
checkdepends=()
#checkdepends=('perl-test-cpan-changes' 'perl-test-pod' 'perl-test-pod-coverage' 'perl-test-trailingspace')
options=('!emptydirs')
_verwatch=("http://www.cpan.org/modules/by-module/${_modnamespace}/" "${_perlmod}-\([0-9\.]*\)\.tar\.gz" 'l')
_srcdir="${_perlmod}-${pkgver}"
source=("${_verwatch[0]}${_perlmod}-${pkgver}.tar.gz")
md5sums=('4f9ae72f4dd4c8f0b9471099663cac64')
sha256sums=('cd9ee04860d09a19a9d6bd2254a4bf3144ac14a63c08f15a1e28601b4b2f7012')
sha512sums=('fc9ebcb7accc07ec66bc8157a679d3905b06dfcf21560641b149c5930e527385ea2be45190190319c73f6d184e3d4f4ce5deaccf3da58b91f45a820e86fea2ac')

build() {
  set -u
  cd "${_srcdir}"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl 'Makefile.PL' INSTALLDIRS='vendor'
  make
  set +u
}

if [ "${#checkdepends[@]}" -ne 0 ]; then
check() {
  set -u
  cd "${_srcdir}"
  make test
  set +u
}
fi

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
