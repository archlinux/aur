# Contributor: mawcomw <mawcomw@gmail.com>
_base=django-reversion
pkgname=python-${_base}
pkgver=6.5.2
pkgrel=1
arch=(any)
url="https://github.com/etianen/${_base}"
pkgdesc="An extension to the Django web framework that provides version control for model instances"
license=('custom')
depends=(python-django)
makedepends=(python-setuptools)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('0c3b7cf525dfd5889d7c4b363241794ed3a1f4074baa2b97fcd08f48f81d6af95e517c1fd939b5f04a898674ec1d9d75ba6afba9ee8cd065ed2b9451b3fb76c8')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
