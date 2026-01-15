# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

set -u
_pybase='csv2odf'
pkgname="python-${_pybase}"
pkgver='2.10_2'
pkgrel='1'
pkgdesc='convert CSV to formatted spreadsheets and documents'
arch=('any')
url="https://sourceforge.net/projects/${_pybase}"
license=('MIT')
depends=('python')
#_pydepends=("python-wcwidth>=0.1.0")
#makedepends=("python-distribute") # same as python-setuptools
#_verwatch=("${url}/files/" "\s\+${_pybase}-\([0-9\.]\+\)</a></th>.*" 'f')
_srcdir="${_pybase}-${pkgver}"
source=("https://master.dl.sourceforge.net/project/${_pybase}/${_srcdir%%_*}/${_srcdir//_/-}.tar.gz")
_srcdir="${_srcdir%%_*}"
md5sums=('817e965a333abda31e24e7d83c09c7c6')
sha256sums=('ce96d6b97cea3364302ca5c17910c489599ac24b4f2d116bb20a0dd0c71597bb')

build() {
  cd "${_srcdir}"
  python -m 'build' --wheel --no-isolation
}

package() {
  cd "${_srcdir}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 'doc/license' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
set +u

# vim:set ts=2 sw=2 et:
