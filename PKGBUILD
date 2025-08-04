# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-packageurl
_gitpkgname=packageurl-python
pkgver=0.17.3
pkgrel=1
pkgdesc='A purl aka. Package URL parser and builder'
arch=('any')
url='https://github.com/package-url/packageurl-python'
license=('MIT')
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest')
optdepends=(
  'python-django-filter: for included contrib scripts'
  'python-sqlalchemy: for included contrib scripts'
)
conflicts=('python-packageurl-git')
options=('!debug' '!strip')
source=("${_gitpkgname}-${pkgver}.tar.gz::https://github.com/package-url/packageurl-python/archive/v${pkgver}.tar.gz")
sha512sums=('3e7ae6c188edf9dcbf707a6cefe429a85898a8befc1091d14b6f895dc5af09d9858d6c45c2063dba40fd6bcfde0f2e10fcd0b13563c726b69c93bb3f6e240380')

build() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  python -m pytest
}

package() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  python -I -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 mit.LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
