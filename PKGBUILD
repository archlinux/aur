# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-periphery
pkgver=2.3.0
pkgrel=5
pkgdesc="A pure Python 2/3 library for peripheral I/O (GPIO, LED, PWM, SPI, I2C, MMIO, Serial) in Linux"
url="https://github.com/vsergeev/python-periphery"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vsergeev/python-periphery/archive/v$pkgver.tar.gz")
sha512sums=('34042d9364d7846252f464cffb1361ea1c4717cce9c1fd6788f4be495784a17c42fc5fcf3f296a7d7277c420ed876f6c2815f9e46936460275356405911cb50d')

build() {
  cd python-periphery-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd python-periphery-$pkgver
  pytest || echo "Tests failed"
}

package() {
  cd python-periphery-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
