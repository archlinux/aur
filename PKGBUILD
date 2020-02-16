# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-periphery
pkgver=2.0.0
pkgrel=1
pkgdesc="A pure Python 2/3 library for peripheral I/O (GPIO, LED, PWM, SPI, I2C, MMIO, Serial) in Linux"
url="https://github.com/vsergeev/python-periphery"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vsergeev/python-periphery/archive/v$pkgver.tar.gz")
sha512sums=('07b3005a9ea0b10a294fc971c3ab8deebe07bf1b773dfc0d9d3343db96ead83cfd1a0a44f60155d67e1e92dbc1779199caa2e869db27c3dff34f2c8c621e0ff1')

build() {
  cd python-periphery-$pkgver
  python setup.py build
}

check() {
  cd python-periphery-$pkgver
  python setup.py pytest || warning "Tests failed"
}

package() {
  cd python-periphery-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
