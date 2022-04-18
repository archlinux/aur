# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Maintainer: Jonne Haß <me@mrzyx.de>

set -u
_perlmod='Text-Levenshtein'
_modnamespace="${_perlmod%%-*}"
pkgname="perl-${_perlmod,,}"
pkgver='0.15'
pkgrel='1'
pkgdesc="Perl CPAN ${_perlmod//-/::} - An implementation of the Levenshtein edit distance"
arch=('any')
url="https://metacpan.org/release/${_perlmod}"
license=('unknown')
depends=('perl>=5.10.0')
options=('!emptydirs')
_verwatch=("http://www.cpan.org/modules/by-module/${_modnamespace}/" "${_perlmod}-\([0-9\.]*\)\.tar\.gz" 'l')
_srcdir="${_perlmod}-${pkgver}"
source=("${_verwatch[0]}${_perlmod}-${pkgver}.tar.gz")
md5sums=('8d20308d078a3c01638b964e3d5008cb')
sha256sums=('6d2e92232caf7550bd6fa8034b8ebbacccd81a8dcefa7a605a8ca539a15d2f22')

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
  set +u
}
set +u
