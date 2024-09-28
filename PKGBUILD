# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_base=usaddress
pkgname=python-${_base}
pkgver=0.5.11
pkgrel=1
pkgdesc="A python library for parsing unstructured United States address strings into address components."
arch=('any')
url="https://github.com/datamade/${_base}"
license=(MIT)
depends=('python' 'python-crfsuite'  'python-probableparsing')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-parserator')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('963f2c9c0309a07911c2cb219d4ff7a09253cb0fbd443bb6256b70f39d8c663163e8195672056c3aaf20c57a67490410475903eb45736fb0f8415459f662cd0b')

build() {
  cd "${_base}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_base}-${pkgver}"
  python -m pytest
}

package() {
  cd "${_base}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
