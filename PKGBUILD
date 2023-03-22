# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname=python-jsonrpcclient
_name=jsonrpcclient
pkgver=4.0.3
pkgrel=2
pkgdesc="Send JSON-RPC requests in Python."
arch=('any')
depends=('python')
makedepends=('python-build' 'python-setuptools' 'python-wheel' 'python-pytest' 'python-installer')
url="https://github.com/explodinglabs/jsonrpcclient"
license=('MIT')
options=('!emptydirs')
source=($pkgname-$pkgver.tar.gz::https://github.com/explodinglabs/$_name/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('f2343c0f4cacb6c7fd0a824593c08dd58e9adf197d9d932fa20fdfeae68bc54e')

build() {
  cd "$srcdir/$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check(){
  cd "$srcdir/$_name-$pkgver"
  pytest
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/license"
}
