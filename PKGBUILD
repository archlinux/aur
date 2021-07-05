# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=blacktex
pkgver=0.5.1
pkgrel=1
pkgdesc="A LaTex code prettifier and formatter"
arch=('any')
url="https://github.com/nschloe/blacktex"
license=('GPL3')
depends=('python>=3.7')
makedepends=('python-setuptools' 'python-dephell')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('b9b72d4be55bf3c0b004883ef0442be255450263740b9673bf22e6bc6f700048')

prepare() {
  cd "$pkgname-$pkgver"
  dephell deps convert --from pyproject.toml --to setup.py
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 444 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
