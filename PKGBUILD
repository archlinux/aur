# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Jean Lucas <jean at 4ray dot co>
# Contributor: Antonio Rojas <arojas at archlinux dot org>
_base=webassets
pkgname=python-${_base}
pkgver=2.0
pkgrel=3
pkgdesc="Asset management application for Python web development"
arch=(any)
url="https://github.com/miracle2k/${_base}"
license=('custom')
depends=(python)
makedepends=(python-setuptools)
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('6d62d4e5c1ed81a2d235c24776b632574f3670ae3d863c5f5a79d0e1afc7acfa7965e532b7975503df758dbe6c8dbd857b250a6ea8e4b414c8f1ae12fb8addd7')

build() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
