# Contributor: Arthur Vuillard <arthur@hashbang.fr>
_base=djangorestframework-camel-case
pkgname=python-${_base/orestf/o-rest-f}
pkgver=1.3.0
pkgrel=1
pkgdesc="Camel case JSON support for Django REST framework"
arch=(any)
url="https://github.com/vbabiy/${_base}"
license=('custom')
depends=(python-django-rest-framework)
makedepends=(python-setuptools)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('5a6f3998caf998cf0302f8c7a3888aaf2d45f598fab74024635c58b14b25735248963b27acdfdba76183c70136a038ed6888059d3b6c6bcbf0de5bb72705dbcc')

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
