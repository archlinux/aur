# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-packageurl
_gitpkgname=packageurl-python
pkgver=0.10.4
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
conflicts=('python-packageurl-git')
options=('!strip')
source=("${_gitpkgname}-${pkgver}.tar.gz::https://github.com/package-url/packageurl-python/archive/v${pkgver}.tar.gz")
sha512sums=('42b64d9b56a866fd90ce483faf292ed567bbf5c0f005ea51dc15d02fe6915bbb1c15a13721937562b7ec365232954482e3f604be2aa26b1dca50898b6d68bc74')

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
