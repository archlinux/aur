# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-py-serializable
_gitpkgname=serializable
pkgver=1.0.1
pkgrel=1
pkgdesc='Serialize and deserialize Python objects to and from JSON and XML'
arch=('any')
url='https://github.com/madpah/serializable'
license=('Apache-2.0')
depends=('python-defusedxml')
checkdepends=('python-lxml' 'xmldiff')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
options=('!strip')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/madpah/serializable/archive/v${pkgver}.tar.gz"
)

sha512sums=(
  '1559b04423e254e7bf0524552cd614946759bfd107a2ca49b44ce35d2b5fded6872b832a4428c0a797431dc5888baa610eff26e0f5e9d46ff930e8c7b402457f'
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
