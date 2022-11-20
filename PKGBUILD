# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-responses
pkgver=0.22.0
pkgrel=1
pkgdesc='A utility library for mocking out the `requests` Python library.'
arch=('any')
license=('Apache')
url='https://github.com/getsentry/responses'
depends=('python38-requests' 'python38-urllib3' 'python38-toml')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest' 'python38-pytest-asyncio' 'python38-pytest-httpserver')
source=("https://github.com/getsentry/responses/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('361e59e02df36fac0fb0ba2a070b730e485ec94fe90490c271e4ac86fae7954a551bf2486714d95c91e9d0b011f06a9d10b0d6408fd4d03234e1224cca1e9d0e')

prepare() {
  cd responses-$pkgver
  sed -i '/types-toml/d' setup.py
}

build() {
  cd responses-$pkgver
  python3.8 setup.py build
}

check() {
  cd responses-$pkgver
  pytest
}

package() {
  cd responses-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
