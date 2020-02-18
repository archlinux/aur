# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-periphery
pkgver=2.0.1
pkgrel=1
pkgdesc="A pure Python 2/3 library for peripheral I/O (GPIO, LED, PWM, SPI, I2C, MMIO, Serial) in Linux"
url="https://github.com/vsergeev/python-periphery"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vsergeev/python-periphery/archive/v$pkgver.tar.gz")
sha512sums=('a90f678435a0933f0db578231e762bb4c71103e595d1b73bb3f60a136f4e7ccc2805becf3156dcc37efbbe0824038986c9af3151083680577262cdcc16994d86')

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
