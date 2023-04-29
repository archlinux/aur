# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=litex
pkgname=python-$_pkgname
pkgver=2021.08
pkgrel=3
pkgdesc='Migen/MiSoC based Core/SoC builder that provides the infrastructure to easily create Cores/SoCs'
arch=('any')
url='https://github.com/enjoy-digital/litex'
license=('BSD')
depends=('python-migen' 'python-pyserial' 'python-requests' 'python-pythondata-software-compiler_rt')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-litedram' 'python-liteeth' 'python-liteiclink' 'python-litesdcard' 'yosys'
              'python-pythondata-cpu-vexriscv' 'python-pythondata-cpu-picorv32' 'python-pythondata-cpu-lm32' 'python-pythondata-cpu-mor1kx'
              'python-litex-boards' 'python-litepcie')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('5f1eb529137eb970373d67d62c56fb6d5ec5e156f41f41a724b7d50a4e7b4b681d9fd5383cdff178f3e6005b4584bcb599fdf6b5d27cb87c3287ca8bf29d2d07')

prepare() {
  # seems like running the tests breaks setup.py install
  cp -r $_pkgname-$pkgver{,-tests}
}

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

check() {
  cd $_pkgname-$pkgver-tests

  pytest
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
