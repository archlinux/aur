# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: max-k <max-k AT post DOT com>

set -u
_pkgnick='Mail_Mime'
_pkgnickl="${_pkgnick,,}"
pkgname="pear-${_pkgnickl//_/-}"
pkgver='1.10.1'
pkgrel='1'
pkgdesc='a class to create MIME messages'
arch=('any')
url="http://pear.php.net/package/${_pkgnick}"
license=('BSD')
depends=('php>=5.0.0')
makedepends=('php-pear>=1.6.0')
options=('!strip')
_verwatch=("http://pear.php.net/package/${_pkgnick}/download" "\([0-9]\+\.[0-9]\+\.[^\.]\+\).*" 't')
source=("http://download.pear.php.net/package/${_pkgnick}-${pkgver}.tgz")
noextract=("${_pkgnick}-${pkgver}.tgz")
sha256sums=('d67f25c5aa03fe560211d10ae93f8b87e6c42c7dd1ac7c26876de39c471c5978')

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
