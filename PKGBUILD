# Maintainer: lmartinez-mirror
pkgname=blacktex
pkgver=0.4.0
pkgrel=1
pkgdesc="A LaTex code prettifier and formatter"
arch=('any')
url="https://github.com/nschloe/blacktex"
license=('GPL3')
depends=('python>=3.7')
makedepends=('python-setuptools' 'python-dephell')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('839a8cf3a986be1c7cc7725f9d33b6306286b907139aebef5b2fcb41cdb88242')

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
