# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pook
pkgver=1.1.0
pkgrel=1
pkgdesc="Versatile and expressive HTTP traffic mocking and testing made simple in Python"
url="https://github.com/h2non/pook"
license=('MIT')
arch=('any')
depends=('python-furl' 'python-jsonschema' 'python-xmltodict')
makedepends=('python-setuptools')
checkdepends=('python-nose' 'python-pytest' 'python-aiohttp' 'python-requests')
source=("https://github.com/h2non/pook/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('9c34bde9180a5545abcaed3eb675dae8f316886073b9e8f3f0e6b717351ea693a143d27a57f03f6364d3a29c9673de6563a0bd5814eae1d7774f97534001b250')

build() {
  cd pook-$pkgver
  python setup.py build
}

check() {
  cd pook-$pkgver
  pytest
}

package() {
  cd pook-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/

  # It's only present when tests are enabled, so adding -f
  rm -rf "$pkgdir"/usr/lib/python3.10/site-packages/tests
}
