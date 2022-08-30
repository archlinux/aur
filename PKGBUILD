# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=litex
pkgname=python-$_pkgname
pkgver=2021.04
pkgrel=1
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
sha512sums=('12015000dd51cf0032fac1ee138bf42ec7eb37db3f91e6fbc6d9bdba66791735e2eb8f0e38bfc004493bbd5d8156827623476169c57b86d0f75ac9fb5a4ced78')

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
