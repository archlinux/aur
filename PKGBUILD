# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: max-k <max-k AT post DOT com>

set -u
_pkgnick='Mail_mime_Decode'
_pkgnickl="${_pkgnick,,}"
pkgname="pear-${_pkgnickl//_/-}"
_pkgnick='Mail_mimeDecode'
pkgver='1.5.6'
pkgrel='1'
pkgdesc='a class to decode MIME messages'
arch=('any')
url="http://pear.php.net/package/${_pkgnick}"
license=('BSD')
depends=('php>=4.3.0')
depends+=('pear-mail-mime>=1.4.0')
makedepends=('php-pear>=1.6.0')
options=('!strip')
_verwatch=("http://pear.php.net/package/${_pkgnick}/download" "\([0-9]\+\.[0-9]\+\.[^\.]\+\).*" 't')
source=("http://download.pear.php.net/package/${_pkgnick}-${pkgver}.tgz")
noextract=("${_pkgnick}-${pkgver}.tgz")
sha256sums=('8323344fb2e3266339675adee6b373dcb9a41c730f34f4141ffe891f2c9818f7')

package() {
  set -u
  cd "${srcdir}"
  local _PEARDIR="${pkgdir}/usr/share/pear"
  local _PEAROPTS=(-D php_dir="${_PEARDIR}" -D doc_dir="${_PEARDIR}/doc")
  local _PEAROPTS+=(-D test_dir="${_PEARDIR}/test")
  local _PEAROPTS+=(-D data_dir="${_PEARDIR}/data")
  pear "${_PEAROPTS[@]}" install -O -n "${_pkgnick}-${pkgver}.tgz"
  rm -r "${_PEARDIR}"/{.channels,.depdb*,.filemap,.lock,.registry}
  set +u
}
set +u
