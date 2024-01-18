_base=djangocms-admin-style
pkgname=python-${_base}
pkgver=3.2.7
pkgrel=1
pkgdesc="Adds pretty CSS styles for the django CMS admin interface"
arch=('any')
url="http://pypi.python.org/pypi/${_base}"
license=('custom')
depends=(python-django)
makedepends=(python-setuptools)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('00d12af0baadeecc000ee1f3cb6fbcf653bcdf7033cc5bf425a6b4b130a82e4b2f5c5f150f9896774d1002961b02e978a7ff3c119c4b0e24005bd5eddad1abeb')

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
