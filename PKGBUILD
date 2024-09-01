# Maintainer: haxibami <contact at haxibami dot net>

pkgname=python-apple-compress
_pkgname="${pkgname#python-}"
pkgver=0.2.3
pkgrel=1
pkgdesc="Python bindings for Apple's libcompression"
arch=('any')
url='https://github.com/m1stadev/apple-compress'
license=('MIT')
depends=('python' 'python-click' 'python-loguru')
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-poetry-core')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a0d19395ed65c2861679336e007910844c99b9ece23f10fb2ae7fbebabbfd00d')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
