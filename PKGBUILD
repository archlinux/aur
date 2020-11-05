# Maintainer: PumpkinCheshire <sollyonzou@gmail.com>

_name=geomet
pkgname=python-geomet
pkgver=0.2.1
pkgrel=1
pkgdesc="GeoMet - Convert GeoJSON to WKT/WKB, and vice versa."
arch=('any')
url="https://pysal.org/libpysal"
license=('Apache')
depends=('python-click' 'python-six')
optdepends=(
  'python-nose: tests'
  'python-coverage: tests'
  'flake8: tests'
)
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('adfafeac8d0b6ccc509f67c61ce6db7feb27a3eca40eaad93b2e29669e3c0297')

prepare() {
  mv -v "${_name}-${pkgver}" "${pkgname}-${pkgver}"
  cd "${pkgname}-${pkgver}"
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  rm "$pkgdir/usr/LICENSE"
}
