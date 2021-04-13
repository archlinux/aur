# Maintainer: lmartinez-mirror
pkgname=blacktex
pkgver=0.3.6
pkgrel=1
pkgdesc="A LaTex code prettifier and formatter"
arch=('any')
url="https://github.com/nschloe/blacktex"
license=('GPL3')
depends=('python>=3.7')
makedepends=('python-setuptools' 'python-dephell')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('b8665c22746478678761280382add0e725b51dd1a4578112c21a1d744cbaff98')

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
