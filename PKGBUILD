# Contributor: mawcomw <mawcomw@gmail.com>
_base=django-reversion
pkgname=python-${_base}
pkgver=4.0.1
pkgrel=1
arch=(any)
url="https://github.com/etianen/${_base}"
pkgdesc="An extension to the Django web framework that provides version control for model instances"
license=('custom')
depends=(python-django)
makedepends=(python-setuptools)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('52d0f7548a1622b6e50dbbcc8cfaa4f5ef2aae1e257b227718e1d9b1906529e8ba569418026cc1a7961f7418aba09e7c90ab4020f6c4021e581dfb8fbfd8b193')

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
