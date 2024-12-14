# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=parsita
pkgname="python-$_pkgname"
pkgver=2.2.1
pkgrel=1
pkgdesc="Parser combinator library for Python."
arch=('any')
url="https://pypi.org/project/parsita"
license=('MIT')
depends=('python' 'python-returns')
makedepends=('python-poetry-core' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-timeout')
source=("$pkgname-$pkgver.tar.gz::https://github.com/drhagen/parsita/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5a3bf1071dd11ded882fbbe1baa5d56ea51b249270ac98ef12770709e5ec014c')
b2sums=('48363c6401a2e1d4ff878d0c2ef06f078034af197ff79f36e469acdeeb0087e92b06a2ed21bb7a5c17192b92ee27e93a669b5ec24e861a010523bb686b44a067')

build() {
  cd "$_pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"

  export PYTHONPATH="src"
  pytest
}

package() {
  cd "$_pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
