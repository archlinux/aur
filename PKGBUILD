# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-py-serializable
_gitpkgname=serializable
pkgver=1.0.3
pkgrel=1
pkgdesc='Serialize and deserialize Python objects to and from JSON and XML'
arch=('any')
url='https://github.com/madpah/serializable'
license=('Apache-2.0')
depends=('python-defusedxml')
checkdepends=('python-lxml' 'xmldiff')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
options=('!debug' '!strip')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/madpah/serializable/archive/v${pkgver}.tar.gz"
)

sha512sums=(
  'f702dc4006f87b2efb5630022e9fe79862ccbb281c34a24b933ed703706e62a07aeccadb55e7874b6fe1ff40d4b8ab67650e632611e69547ebdf3d6b21c4d0c3'
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
