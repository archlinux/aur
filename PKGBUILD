# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Maintainer: Jonne Haß <me@mrzyx.de>

set -u
_perlmod='Text-Levenshtein'
_modnamespace="${_perlmod%%-*}"
pkgname="perl-${_perlmod,,}"
pkgver='0.14'
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
sha256sums=('24fd63aa83c73fdc1d610c562720a618f6f9766ab6194ffd6d9558b8a94b9b8d')

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
