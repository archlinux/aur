_base=djangocms-admin-style
pkgname=python-${_base}
pkgver=2.0.2
pkgrel=1
pkgdesc="Adds pretty CSS styles for the django CMS admin interface"
arch=('any')
url="http://pypi.python.org/pypi/${_base}"
license=('custom')
depends=(python)
makedepends=(python-setuptools)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('e6cd6def086d7195b3781feba891ff56349b6a5e39f8cfad8a129f7e3f158c0445aee7d182bfe2c6cf311aa3563dadda10474b95c557d7c61526d75dcf8285eb')

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
