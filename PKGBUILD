# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Roel Blaauwgeers <roel at ttys0.nl>
# Contributor: Archme <archme.mail@gmail.com>

set -u
_pyver="python2"
_pybase='lshell'
_pyverother='python python2 '
_pyverother=(${_pyverother//${_pyver} /})
pkgname="${_pyver}-${_pybase}"
pkgver='0.9.17'
pkgrel='1'
pkgdesc="Limited Shell, lets you restrict a user's environment to limited sets of commands, and more"
arch=('any')
license=('GPL')
#url='http://lshell.ghantoos.org/'
url="https://github.com/ghantoos/${_pybase}"
backup=('etc/lshell.conf')
makedepends=("${_pyver}" "${_pyver}-distribute") # same as python-setuptools
_srcdir="${_pybase}-${pkgver}"
_verwatch=("${url}/releases" "${url#*github.com}/archive/\(.*\)\.tar\.gz" 'l')
source=("${_pybase}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
#source=("${pkgname}-${pkgver}.tar.gz::https://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz/download")
sha256sums=('e3ec1dad37e8da192604ee39f83d26acc8c8e8a227a8ba216e9caaa6abd7809d')

package() {
  set -u
  depends=("${_pyver}") # "${_pydepends[@]}")
  conflicts=("${_pybase}" "${_pyverother[@]/%/-${_pybase}}")
  cd "${_srcdir}"
  ${_pyver} setup.py install --root="${pkgdir}" --optimize=1
  install -Dpm644 'COPYING' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  set +u
}
set +u

# vim:set ts=2 sw=2 et:
