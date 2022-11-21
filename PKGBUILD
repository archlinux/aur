# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>

pkgname=python38-prometheus_client
pkgver=0.15.0
pkgrel=2

pkgdesc="Prometheus instrumentation library for Python applications"
url="https://github.com/prometheus/client_python"
arch=('any')
license=('APACHE')

depends=('python38')
makedepends=('python38-setuptools')
checkdepends=('python38-twisted' 'python38-pytest')

source=(client_python-$pkgver.tar.gz::https://github.com/prometheus/client_python/archive/v${pkgver}.tar.gz)

sha512sums=('ea11cb2fc08bd5e10ea97ee3be3068a2c37cbaa45ab3e146f8a0080074f69e7744ff90d1a0fb4f01eaefd1efc5f76428d6c898bead85d5fa37b6a59e9f832134')

build() {
  cd client_python-$pkgver
  python3.8 setup.py build
}

check() {
  cd client_python-$pkgver
  # Make reproducible by not writing pyc files for test files. (rebuilderd does not run tests)
  PYTHONDONTWRITEBYTECODE=1 python3.8 -m unittest discover -vs .
}

package() {
  cd client_python-$pkgver
  python3.8 setup.py install --root="$pkgdir" --skip-build --optimize=1
}
