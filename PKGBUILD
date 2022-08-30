# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=litex-boards
pkgname=python-$_pkgname
pkgver=2021.04
pkgrel=1
pkgdesc='Small footprint and configurable Ethernet core'
arch=('any')
url="https://github.com/litex-hub/$_pkgname"
license=('BSD')
depends=('python-migen' 'python-litex' 'python-litedram' 'python-liteeth' 'python-liteiclink' 'python-litejesd204b'
         'python-litepcie' 'python-litesata' 'python-litescope' 'python-litesdcard' 'python-litevideo')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('022d5b07585ea3f99ffaa5469b0b9ea0c1503fe67b1e55c656e637ccd58cd69a1dc1e9ab3e33fec46ce089b2a22e25576ba8e5a9424bbcbf606144a80302b9da')

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
