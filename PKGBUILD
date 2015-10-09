# Maintainer: Thomas Sarboni <max-k@post.com>

pkgbase=python-flask-restful
pkgname=('python-flask-restful' 'python2-flask-restful')
_realname=Flask-RESTful
pkgver=0.3.4
pkgrel=3
pkgdesc='A Flask extension for creating REST APIs'
_baseurl='https://pypi.python.org'
url="${_baseurl}/pypi/${_realname}"
arch=('any')
license=('BSD')
makedepends=('python-distribute' 'python2-distribute')
conflicts=('python2-flask-restful-git')
source=("${_baseurl}/packages/source/F/${_realname}/${_realname}-${pkgver}.tar.gz"
        'LICENSE')
md5sums=('896aff2720fcd915aacfd5651eab20d1'
         '685bb55ed99a366bb431995f5eef2783')

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

