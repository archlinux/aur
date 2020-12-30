# Maintainer: PumpkinCheshire <sollyonzou@gmail.com>

_name=geomet
pkgname=python-geomet
pkgver=0.3.0
pkgrel=1
pkgdesc="GeoMet - Convert GeoJSON to WKT/WKB, and vice versa."
arch=('any')
url="https://github.com/geomet/geomet"
license=('Apache')
depends=('python-click' 'python-six')
optdepends=(
  'python-nose: tests'
  'python-coverage: tests'
  'flake8: tests'
)
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
  "https://raw.githubusercontent.com/geomet/geomet/master/LICENSE")
sha256sums=('cb52411978ee01ff104ab48f108d7333b14423ae7a15a65fee25b7d29bda2e1b'
            'cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # rm "$pkgdir/usr/LICENSE"
}
