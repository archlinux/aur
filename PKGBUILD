# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-periphery
pkgver=2.1.0
pkgrel=2
pkgdesc="A pure Python 2/3 library for peripheral I/O (GPIO, LED, PWM, SPI, I2C, MMIO, Serial) in Linux"
url="https://github.com/vsergeev/python-periphery"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vsergeev/python-periphery/archive/v$pkgver.tar.gz")
sha512sums=('50ac373017ea5ce8e222b17cddbe38044ef0ebcdb050ed24a05bc5304bf834ac6628e81372267dfe58e084f596f8173caab7cc083b6e3691f4d392aa8570d621')

build() {
  cd python-periphery-$pkgver
  python setup.py build
}

check() {
  cd python-periphery-$pkgver
  python setup.py pytest || echo "Tests failed"
}

package() {
  cd python-periphery-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
