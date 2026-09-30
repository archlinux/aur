# Maintainer: Sarvjeet Singh <sarvjeet@gmail.com>
pkgname=python-lakshmi
_name=lakshmi
pkgver=3.0.3
pkgrel=1
pkgdesc="Investing library and command-line interface (lak) inspired by the Bogleheads philosophy"
arch=('any')
url="https://github.com/sarvjeets/lakshmi"
license=('MIT')
depends=('python' 'python-click' 'python-curl_cffi' 'python-ibonds'
         'python-numpy' 'python-pyxirr' 'python-yaml' 'python-requests'
         'python-tabulate' 'python-yfinance')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('7340dbedd59dbc14e665d2579cca4a85dbf6c6c630c51b4182c37f392862bbea')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
