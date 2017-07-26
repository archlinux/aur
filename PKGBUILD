# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>

set -u
_pkgnick='Net_IDNA2'
_pkgnickl="${_pkgnick,,}"
pkgname="pear-${_pkgnickl//_/-}"
pkgver='0.2.0'
pkgrel='1'
pkgdesc='Object oriented interface for searching and manipulating LDAP-entries'
arch=('any')
url="http://pear.php.net/package/${_pkgnick}"
license=('PHP')
depends=('php>=5.4.0')
makedepends=('php-pear>=1.10.1')
options=('!strip')
_verwatch=("http://pear.php.net/package/${_pkgnick}/download" "\([0-9]\+\.[0-9]\+\.[^\.]\+\).*" 't')
source=("http://download.pear.php.net/package/${_pkgnick}-${pkgver}.tgz")
noextract=("${_pkgnick}-${pkgver}.tgz")
sha256sums=('e96ca277544e9dc35b3b4bf35802765c9afd2820cb786fd4346bd854268dabdf')

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
