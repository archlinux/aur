# Maintainer: Jesse R Codling <codling@umich.edu>

pkgname=python-periphery
pkgver=2.4.1
pkgrel=1
pkgdesc="A pure Python 2/3 library for peripheral I/O (GPIO, LED, PWM, SPI, I2C, MMIO, Serial) in Linux"
url="https://github.com/vsergeev/python-periphery"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
# checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vsergeev/python-periphery/archive/v$pkgver.tar.gz")
sha512sums=('3ea16ce51f135aefc4b438d80bbd15c1ec867c87f2224e3ee28ba41f636cc6f61a383c7bb63077e18c31fa63a441efa3f30ad9b550430e24cb7ef403439e98ba')

build() {
  cd python-periphery-$pkgver
  python -m build --wheel --no-isolation
}

# Tests can't normally be run, require a specfific test bench environment
# check() {
#   cd python-periphery-$pkgver
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest
# }

package() {
  cd python-periphery-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
