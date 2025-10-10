# Contributor: mawcomw <mawcomw@gmail.com>
_base=django-reversion
pkgname=python-${_base}
pkgver=6.0.0
pkgrel=1
arch=(any)
url="https://github.com/etianen/${_base}"
pkgdesc="An extension to the Django web framework that provides version control for model instances"
license=('custom')
depends=(python-django)
makedepends=(python-setuptools)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('009ec3ca164d2591c2db84e76e24dfd8c2a053348cda36f7bb5533a4293ed9ada19468be0e4a0c5b57219f8114103bbac9812204448b694bfa47371d2861abe9')

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
