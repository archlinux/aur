# Maintainer: Jaro Zink <j dot zink at outlook dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-teletype
_name=${pkgname#python-}
pkgver=1.3.4
pkgrel=1
pkgdesc='Cross-platform Python tty library'
arch=('any')
url='https://github.com/jkwill87/teletype'
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-setuptools')
source=("${_name}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('2dff646aba2ffa788ebc0cedc425eb1d180e7bef66e87ed8cd8b7d3aeba7e8ba')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
