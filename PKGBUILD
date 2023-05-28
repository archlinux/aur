# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-packageurl
_gitpkgname=packageurl-python
pkgver=0.11.2
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
optdepends=('python-django-filter: for included contrib scripts')
conflicts=('python-packageurl-git')
options=('!strip')
source=("${_gitpkgname}-${pkgver}.tar.gz::https://github.com/package-url/packageurl-python/archive/v${pkgver}.tar.gz")
sha512sums=('e301a7b9bede933f0b6a5a2b462fef009b4beafb85601e35764092ee2daf5a807b98366296d144cb8cefd97185a473bf347d1f00f0094130d0975b565dd5ff44')

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
