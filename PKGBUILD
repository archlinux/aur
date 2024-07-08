# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-py-serializable
_gitpkgname=serializable
pkgver=1.1.0
pkgrel=1
pkgdesc='Serialize and deserialize Python objects to and from JSON and XML'
arch=('any')
url='https://github.com/madpah/serializable'
license=('Apache-2.0')
depends=('python' 'python-defusedxml')
checkdepends=('python-lxml' 'xmldiff')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
options=('!debug' '!strip')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/madpah/serializable/archive/v${pkgver}.tar.gz"
)

sha512sums=('05c39e351f49e850cf3fe20b3fd1025529ac86e225afbb2e817e9ae2378260faf00f6982bfec93739a4944b9d0c74b7cd6325aad4b678f4c5fbc1ff4ed6bd111')

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
