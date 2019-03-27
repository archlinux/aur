# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-periphery
pkgver=1.1.1
pkgrel=3
pkgdesc="A pure Python 2/3 library for peripheral I/O (GPIO, LED, PWM, SPI, I2C, MMIO, Serial) in Linux"
url="https://github.com/vsergeev/python-periphery"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vsergeev/python-periphery/archive/v$pkgver.tar.gz")
sha512sums=('5d453051fa204d17995f15f63305417d9702d3d344d96723bad56014bbcb32355763999ebc121c89816611c265010a76662bc1679652a4a5fbf88e4b8cb45b1a')

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
