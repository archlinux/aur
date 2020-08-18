# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: mmirate
# Contributor: pshevtsov
# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

set -u
_perlmod='Text-Table'
_modnamespace="${_perlmod%%-*}"
pkgname="perl-${_perlmod,,}"
pkgver='1.134'
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
md5sums=('8809bb220ce68fcf6f513531c15128d0')
sha256sums=('bacf429b18b7c0b22c088219055063e3902749531d488ebd7b17eab7757cd10b')
sha512sums=('ee10c9811a42a07b270ed28c310b0f836a47f1706d541849f7c12d39b7603dd4c05ab4fd4e9f8fc3065b3f30d2f4ee7eb8954221af5a825346eae4493fed94c9')

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
