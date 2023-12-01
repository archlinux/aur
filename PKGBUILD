# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-py-serializable
_gitpkgname=serializable
pkgver=0.16.0
pkgrel=1
pkgdesc='Serialize and deserialize Python objects to and from JSON and XML'
arch=('any')
url='https://github.com/madpah/serializable'
license=('Apache')
depends=('python-defusedxml')
checkdepends=('python-lxml' 'xmldiff')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
options=('!strip')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/madpah/serializable/archive/v${pkgver}.tar.gz"
)

sha512sums=(
  'e121eca6d0261d1e353d5a2b7aa589677e08899d5ff2ff19b4093e043ef1e30e10a9a3ec9a74f677b94bcb8d1a3925ea68810eda0cf9ff7102097de7732f9ed1'
)

build() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  python -m unittest
}

package() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  python -I -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
