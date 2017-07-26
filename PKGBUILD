# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: jsteel <mail at jsteel dot org>

set -u
_pkgnick='Auth_SASL2'
_pkgnickl="${_pkgnick,,}"
pkgname="pear-${_pkgnickl//_/-}"
pkgver='0.2.0'
pkgrel='1'
pkgdesc='generate responses to common SASL mechanisms'
arch=('any')
url="http://pear.php.net/package/${_pkgnick}"
license=('PHP')
depends=('php>=5.4.0')
makedepends=('php-pear>=1.10.1')
options=('!strip')
_verwatch=("http://pear.php.net/package/${_pkgnick}/download" "\([0-9]\+\.[0-9]\+\.[^\.]\+\).*" 't')
source=("http://download.pear.php.net/package/${_pkgnick}-${pkgver}.tgz")
noextract=("${_pkgnick}-${pkgver}.tgz")
sha256sums=('e6bd0bd43321761789667750061923a48840f564fda245f783de8de8447c6aec')

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
