# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: DJ Lucas <dj_AT_linuxfromscratch_DOT_org>
# Category: lib

set -u
pkgname='pear-mdb2'
_pkgnick='MDB2'
pkgver='2.5.0b5'
pkgrel=1
pkgdesc='Provides a class to create MIME messages.'
arch=('any')
url="http://pear.php.net/package/${_pkgnick}"
license=('BSD')
depends=('php>=4.3.0')
makedepends=('php-pear>=1.6.0')
options=('!strip')
noextract=("${_pkgnick}-${pkgver}.tgz")
source=("http://download.pear.php.net/package/${_pkgnick}-${pkgver}.tgz")
sha256sums=('c4ab3cf8cea4aacff02d729998b0ac80b4f92c2cc8055956079b323a406d985b')

package() {
  set -u
  cd "${srcdir}"
  local _PEARDIR="${pkgdir}/usr/share/pear"
  local _PEAROPTS="-D php_dir=${_PEARDIR} -D doc_dir=${_PEARDIR}/doc"
  local _PEAROPTS="${_PEAROPTS} -D test_dir=${_PEARDIR}/test"
  local _PEAROPTS="${_PEAROPTS} -D data_dir=${_PEARDIR}/data"
  pear ${_PEAROPTS} install -O -n "${_pkgnick}-${pkgver}.tgz"
  rm -r "${_PEARDIR}"/{.channels,.depdb*,.filemap,.lock,.registry}
  set +u
}
set +u
