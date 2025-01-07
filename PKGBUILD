# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>

pkgname=python-pytest-subprocess
pkgdesc='Pytest plugin to fake subprocess'
url='https://github.com/aklajnert/pytest-subprocess'
pkgver=1.5.3
pkgrel=1
arch=('any')
license=('MIT')

depends=(
  'python-pytest'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-anyio'
  'python-docutils'
  'python-pygments'
  'python-pytest-asyncio'
  'python-pytest-rerunfailures'
)

source=(
  "git+https://github.com/aklajnert/pytest-subprocess.git#tag=$pkgver"
)
sha256sums=(
  '20369ba261a1075824ef57cc5a80e9f2be55cfc2836ce1a45648a085b003aba7'
)

build() {
  cd pytest-subprocess
  python -m build --wheel --no-isolation
}

check() {
  cd pytest-subprocess
  python -m venv --system-site-packages testenv
  testenv/bin/python -m installer dist/pytest_subprocess-"$pkgver"-*.whl
  testenv/bin/python -m pytest
}

package() {
  cd pytest-subprocess
  python -m installer --destdir="$pkgdir" dist/pytest_subprocess-"$pkgver"-*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
