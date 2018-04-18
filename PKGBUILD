# Maintainer: Thomas Sarboni <max-k@post.com>

pkgbase=python-flask-restful
pkgname=('python-flask-restful' 'python2-flask-restful')
_realname=Flask-RESTful
pkgver=0.3.6
pkgrel=1
pkgdesc='A Flask extension for creating REST APIs'
_baseurl='https://pypi.python.org'
url="${_baseurl}/pypi/${_realname}"
arch=('any')
license=('BSD')
makedepends=('python-distribute' 'python2-distribute' 'python-aniso8601>=0.82' 'python2-aniso8601>=0.82')
conflicts=('python2-flask-restful-git')
source=("${_baseurl}/packages/source/F/${_realname}/${_realname}-${pkgver}.tar.gz"
        'LICENSE')
sha256sums=('5795519501347e108c436b693ff9a4d7b373a3ac9069627d64e4001c05dd3407'
            '3c58e83b4264e68926b21020322c79f916530b4b054ff1095a90bf0ad41c0b23')

prepare() {
  # We ship separated python{,2}-packaging packages.
  cp -a ${_realname}-${pkgver}{,-python2}
}

build() {
  # Build python 3 module
  cd "${srcdir}/${_realname}-${pkgver}"
  python3 setup.py build

  # Build python 2 module
  cd "${srcdir}/${_realname}-${pkgver}-python2"
  python2 setup.py build
}

package_python-flask-restful() {
  depends=('python-flask>=0.8' 'python-six>=1.3.0' 'python-pytz' 'python-aniso8601>=0.82')

  cd "${srcdir}/${_realname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build

  _licenses_path="${pkgdir}/usr/share/licenses/python-flask-restful"
  install -D -m644 ${srcdir}/LICENSE "${_licenses_path}/LICENSE"
}

package_python2-flask-restful() {
  depends=('python2-flask>=0.8' 'python2-six>=1.3.0' 'python2-pytz' 'python2-aniso8601>=0.82')

  cd "${srcdir}/${_realname}-${pkgver}-python2"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build

  _licenses_path="${pkgdir}/usr/share/licenses/python2-flask-restful"
  install -D -m644 ${srcdir}/LICENSE "${_licenses_path}/LICENSE"
}

