# Maintainer: Matthew Sexton <matthew@asylumtech.com>
pkgname=isitup
pkgver=0.3.1
pkgrel=2
pkgdesc="Check whether a website is up or down"
arch=('any')
url="https://github.com/lord63/isitup"
license=('MIT')
depends=( 'python' 'python-requests' 'python-click')

makedepends=('python-build' 'python-installer' 'python-pypandoc' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('8db270ef375f5597baeed1e3ed152b98a23c212f3353341adc4d0b3bd57ae842')

build() {
  cd "$pkgname-$pkgver"
  sed -i 's/convert/convert_file/' setup.py # Fix issue using deprecated pypandoc syntax.
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
