# Maintainer: lmartinez-mirror
pkgname=blacktex
pkgver=0.3.4
pkgrel=1
pkgdesc="A LaTex code prettifier and formatter"
arch=('any')
url="https://github.com/nschloe/blacktex"
license=('GPL3')
depends=('python>=3.7')
makedepends=('python-setuptools' 'python-dephell')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('d80959c4d366514b652782389f82f16097a5d600c2e17dd1b39c2e5cdde07d74')

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
