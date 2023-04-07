# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=litex-boards
pkgname=python-$_pkgname
pkgver=2021.08
pkgrel=2
pkgdesc='Small footprint and configurable Ethernet core'
arch=('any')
url="https://github.com/litex-hub/$_pkgname"
license=('BSD')
depends=('python-migen' 'python-litex' 'python-litedram' 'python-liteeth' 'python-liteiclink' 'python-litejesd204b'
         'python-litepcie' 'python-litesata' 'python-litescope' 'python-litesdcard' 'python-litevideo')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('cdf309fe5cb0da2db12445388b27997698ebd31b5e5f61bf70c543e75f618b5c4cdf13c1e6b393b389176f9aa1fb0e77d64b2cafba4103a7eb133b913301b731')

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # remove tests
  rm -rf "$pkgdir"/usr/lib/python*/site-packages/test
}
