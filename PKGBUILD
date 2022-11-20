# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-hyperframe
pkgver=6.0.1
pkgrel=3
pkgdesc="HTTP/2 framing layer for Python"
arch=('any')
license=('MIT')
url="https://hyper.rtfd.org"
depends=('python38')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/python-hyper/hyperframe/archive/v$pkgver.tar.gz")
sha512sums=('b4170194ef7504f0897a9cee689b32e22784e9b0d98d6da267b62983f013758acbfe53df9d6f6fad5f9709299e95ed32e1e73213f9515a4de20bd5c36fa39814')

build() {
  cd "$srcdir"/hyperframe-$pkgver
  python3.8 setup.py build
}

check() {
  cd "$srcdir"/hyperframe-$pkgver
  python3.8 setup.py pytest
}

package_python38-hyperframe() {
  cd hyperframe-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
