# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Category: lib

# PKGBUILD from pear-mdb2
set -u
pkgname='pear-mdb2-mysql'
_pkgnick='MDB2_Driver_mysql'
pkgver='1.5.0b4'
pkgrel=1
pkgdesc='This is the MySQL driver for pear-MDB2'
arch=('any')
url="http://pear.php.net/package/${_pkgnick}"
license=('BSD')
depends=('php>=4.3.0' 'pear-mdb2>=2.5.0b4')
makedepends=('php-pear>=1.6.0')
options=('!strip')
noextract=("${_pkgnick}-${pkgver}.tgz")
source=("http://download.pear.php.net/package/${_pkgnick}-${pkgver}.tgz")
sha256sums=('df9345235a8e707d9c81fbd6d5efd12e20c563a54a40d48bc411148118b5199a')

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
