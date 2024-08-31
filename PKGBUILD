# Contributor: mawcomw <mawcomw@gmail.com>
_base=django-reversion
pkgname=python-${_base}
pkgver=5.1.0
pkgrel=1
arch=(any)
url="https://github.com/etianen/${_base}"
pkgdesc="An extension to the Django web framework that provides version control for model instances"
license=('custom')
depends=(python-django)
makedepends=(python-setuptools)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('309dc918b0c438e3620aabadcaf43735866966d455d1516c4865abb34ec35691ba0eddfcf769ac4e4ef36d10647a7508e9a5236bf18899dbf0c9fe0bb6611b04')

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
