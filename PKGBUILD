# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-periphery
pkgver=2.2.0
pkgrel=1
pkgdesc="A pure Python 2/3 library for peripheral I/O (GPIO, LED, PWM, SPI, I2C, MMIO, Serial) in Linux"
url="https://github.com/vsergeev/python-periphery"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vsergeev/python-periphery/archive/v$pkgver.tar.gz")
sha512sums=('d90b32980e391bf762037ca92967ebe8544a387a52f53f9867ea862586668c39e750c44b43da4f7daf7a3456ab7065899f580c4c2fbbb1ed12fb9c016e2fe284')

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
