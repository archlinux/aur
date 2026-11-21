# Maintainer: Sarvjeet Singh <sarvjeet@gmail.com>
pkgname=python-lakshmi
_name=lakshmi
pkgver=3.2.0
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
sha256sums=('9a7257f31a29e4a7f3dbed1982d47ba2d27e0a8d1ecdbf506bf995fbcfe91850')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
