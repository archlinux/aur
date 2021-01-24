# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=litejesd204b
pkgname=python-$_pkgname
pkgver=2020.12
pkgrel=1
pkgdesc='Small footprint and configurable JESD204B core'
arch=('any')
url="https://github.com/enjoy-digital/$_pkgname"
license=('BSD')
depends=('python-migen' 'python-litex')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('cd71ea9eddb55949b10412604983b2f2f093f29e81ca536d1e3a522c8e6b0e3af4ac20ee07b4a351241a3059d79d56837772d02abb1b0887612f27b8838582a6')

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

check() {
  cd $_pkgname-$pkgver

  python setup.py pytest
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
