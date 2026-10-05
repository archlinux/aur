# Maintainer: Sarvjeet Singh <sarvjeet@gmail.com>
pkgname=python-lakshmi
_name=lakshmi
pkgver=3.1.0
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
sha256sums=('3fb2ffae59f81c62db971e5309cd96a4b3af244155cf0de7087b84eb00bbb00c')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
