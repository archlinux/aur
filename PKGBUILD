# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>

pkgname=python-pytest-subprocess
pkgdesc='Pytest plugin to fake subprocess'
url='https://github.com/aklajnert/pytest-subprocess'
pkgver=1.5.2
pkgrel=1
arch=('any')
license=('MIT')

depends=('python-pytest')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=(
  'python-anyio'
  'python-docutils'
  'python-pygments'
  'python-pytest-asyncio'
  'python-pytest-rerunfailures'
)

_pkgname=pytest_subprocess
source=(
  "https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz"
)
sha256sums=(
  'ad3ca8a35e798bf9c82d9f16d88700b30d98c5a28236117b86c5d6e581a8ed97'
)

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"
  python -m venv --system-site-packages testenv
  testenv/bin/python -m installer dist/pytest_subprocess-"$pkgver"-*.whl
  testenv/bin/python -m pytest
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/pytest_subprocess-"$pkgver"-*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
