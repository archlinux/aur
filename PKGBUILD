# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pook
pkgver=1.0.2
pkgrel=1
pkgdesc="Versatile and expressive HTTP traffic mocking and testing made simple in Python"
url="https://github.com/h2non/pook"
license=('MIT')
arch=('any')
depends=('python-furl' 'python-jsonschema' 'python-xmltodict')
makedepends=('python-setuptools')
checkdepends=('python-nose' 'python-pytest' 'python-requests')
source=("https://github.com/h2non/pook/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('c471e85620625522591937e0828a098efd8ddcad9c55fa6a7532131f63891976d0cb68d23dd5c380b05520d6dea24080d2cb7203ece7f158b4b7c1ec0cfff2bd')

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
  rm -rf "$pkgdir"/usr/lib/python3.9/site-packages/tests
}
