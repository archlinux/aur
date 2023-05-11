# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Ista Zahn <istazahn[at]gmail[dot]com>

pkgbase=python-altair
_pyname=altair
pkgname=('python-altair')
pkgver=5.0.0
pkgrel=2
pkgdesc="Declarative statistical visualization library for Python"
arch=('any')
url="https://altair-viz.github.io/"
license=('BSD3')
depends=(python-jinja python-jsonschema python-numpy python-pandas python-toolz)
makedepends=(python-build python-installer python-wheel python-hatchling)
optdepends=('python-selenium: png and svg export support')
source=("${_pyname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz")
sha256sums=('394c3d8be96f9cc90e15a0eee3634cc5b6f19e470fd2045759892623bd9a3fb2')


build () {
  cd "${_pyname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pyname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
  
  # Remove unnecessary and wrongly installed files
  rm -v "$pkgdir"/usr/lib/python3.11/site-packages/{README.md,LICENSE,pyproject.toml}
}

# vim:set et sw=2 ts=2 tw=79:
