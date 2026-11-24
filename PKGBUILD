# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=polyterm
pkgver=0.11.6
pkgrel=1
pkgdesc="Polymarket prediction markets in the terminal"
arch=('any')
url="https://github.com/nytemodeonly/polyterm"
license=('MIT')
depends=('python' 'python-anyio' 'python-click' 'python-dateutil' 'python-packaging' 'python-requests' 'python-rich' 'python-websockets')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nytemodeonly/polyterm/archive/v${pkgver}.tar.gz")
sha256sums=('2b7d592560c02c6ffbb169380b98864b58fd1050a43971ea6a7f4d5eadcac362')

build() {
  cd "polyterm-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "polyterm-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  rm -rf "${pkgdir}"/usr/lib/python3.*/site-packages/tests
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
