# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: Jonathan Steel <jsteel at aur.archlinux.org>

set -u
pkgname='pear-net-socket'
_pkgnick='Net_Socket'
pkgver='1.2.2'
pkgrel='1'
pkgdesc='Net_Socket is a class interface to TCP sockets. It provides blocking and non-blocking operation, with different reading and writing modes'
arch=('any')
url="http://pear.php.net/package/${_pkgnick}"
license=('PHP')
depends=('php>=5.4.0')
makedepends=('php-pear')
_verwatch=("http://pear.php.net/package/${_pkgnick}/download" "\([0-9]\+\.[0-9]\+\.[^\.]\+\).*" 't')
source=("http://download.pear.php.net/package/${_pkgnick}-${pkgver}.tgz")
noextract=("${_pkgnick}-${pkgver}.tgz")
sha256sums=('1f971cf0f80fa6a7bbbebb8695917293eaede976680718413847177633a41689')

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
