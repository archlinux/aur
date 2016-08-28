# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Jason St. John <jstjohn .. purdue . edu>
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>
# Contributor: Francois Charette <firmicus@gmx.net>

set -u
_perlmod='Font-TTF'
_modnamespace='Font'
pkgname="perl-${_perlmod,,}"
pkgver='1.06'
pkgrel='1'
pkgdesc="${_perlmod//-/::} - Perl module for TrueType font hacking"
arch=('any')
url="http://search.cpan.org/dist/${_perlmod}"
license=('Artistic2.0')
depends=('perl-io-string')
options=('!emptydirs')
_verwatch=("http://www.cpan.org/modules/by-module/${_modnamespace}/" "${_perlmod}-\([0-9\.]*\)\.tar\.gz" 'l')
source=("${_verwatch[0]}${_perlmod}-${pkgver}.tar.gz")
sha256sums=('4b697d444259759ea02d2c442c9bffe5ffe14c9214084a01f743693a944cc293')

build() {
  set -u
  cd "${_perlmod}-${pkgver}"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl 'Makefile.PL' INSTALLDIRS='vendor'
  make
  set +u
}

check() {
  set -u
  cd "${_perlmod}-${pkgver}"
  make test
  set +u
}

package() {
  set -u
  cd "${_perlmod}-${pkgver}"
  make install DESTDIR="${pkgdir}"
  set +u
}
set +u
# vim:set ts=2 sw=2 et:
