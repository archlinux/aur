# Contributor: mawcomw <mawcomw@gmail.com>
_base=django-reversion
pkgname=python-${_base}
pkgver=6.3.0
pkgrel=1
arch=(any)
url="https://github.com/etianen/${_base}"
pkgdesc="An extension to the Django web framework that provides version control for model instances"
license=('custom')
depends=(python-django)
makedepends=(python-setuptools)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('1679add186fa1f88db553b78770614947f64b1c284e98282b764f2e7a54afd857f47d738ea7ac92c4e3d4e1a4d13c3036b65a4c593123a5dda19ed4206ddd456')

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
