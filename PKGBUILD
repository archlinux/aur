pkgname=python-sentence-stream
_pkgname=sentence-stream
pkgver=1.3.0
pkgrel=1
pkgdesc="Small sentence splitter for text streams"
arch=(any)
url="https://github.com/OHF-Voice/sentence-stream"
license=('Apache-2.0')
depends=(python python-regex)
makedepends=(git python-setuptools python-build python-installer python-wheel)
checkdepends=('python-pytest' 'python-pytest-asyncio')
source=("git+https://github.com/OHF-Voice/$_pkgname.git#tag=v$pkgver")
sha256sums=('61037186d78e042c4cb27dd0d6142e78e2ef54374435f4b9f0cd559a74bf2339')

build() {
  cd ${_pkgname}
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${_pkgname}
  python -m installer --destdir="$pkgdir" dist/*.whl
}

