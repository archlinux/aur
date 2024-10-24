# Maintainer: bitcoinlizard <bitcoinlizard at fastmail dot com>

pkgname=python-simple-websocket
pkgver=1.1.0
pkgrel=1
pkgdesc="Simple WebSocket server and client for Python."
arch=('any')
url="https://blog.miguelgrinberg.com/"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
depends=('python' 'python-wsproto')
source=("https://github.com/miguelgrinberg/simple-websocket/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('ad8dc86dee3d05d70a686892a8864ec7fa797397785d59ede6aa7183475a681b')

build() {
#  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  cd "simple-websocket-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "simple-websocket-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  
  # Install license since the package doesn't include it
  install -Dm 644 "${srcdir}/simple-websocket-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
