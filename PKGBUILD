# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: mmirate
# Contributor: pshevtsov
# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

set -u
_perlmod='Text-Table'
_modnamespace="${_perlmod%%-*}"
pkgname="perl-${_perlmod,,}"
pkgver='1.135'
pkgrel='1'
pkgdesc="Perl CPAN ${_perlmod//-/::} - Organize Data in Tables"
arch=('any')
url="https://metacpan.org/release/${_perlmod}"
license=('PerlArtistic' 'GPL')
depends=('perl')
depends+=('perl-text-aligner>=0.05')
checkdepends=()
#checkdepends=('perl-test-cpan-changes' 'perl-test-pod' 'perl-test-pod-coverage' 'perl-test-trailingspace')
options=('!emptydirs')
_verwatch=("http://www.cpan.org/modules/by-module/${_modnamespace}/" "${_perlmod}-\([0-9\.]*\)\.tar\.gz" 'l')
_srcdir="${_perlmod}-${pkgver}"
source=("${_verwatch[0]}${_perlmod}-${pkgver}.tar.gz")
md5sums=('6bea3ce614b6c28460f1af96114709a6')
sha256sums=('fca3c16e83127f7c44dde3d3f7e3c73ea50d109a1054445de8082fea794ca5d2')
sha512sums=('1cbacfe2325c8d28aa27590da1d86db75e478321382518319ae16b93daf1e92c3767ad250a739d59d8fb76f6101dcdff23e0e5f1f817100576f69b2f82c8ae7d')

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
