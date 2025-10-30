# Maintainer: Anna Schumaker <anna@nowheycreamery.com>

pkgname=python-liblistenbrainz
pkgver=0.6.1
pkgrel=1
pkgdesc='A simple Python library for the ListenBrainz Web API'
url='https://listenbrainz.org/'
arch=('any')
license=('GPL3')
depends=('python-requests' 'python-importlib-metadata')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
checkdepends=('python-pytest' 'python-requests-mock')
optdepends=()
source=("${pkgname}::git+https://github.com/metabrainz/liblistenbrainz.git#tag=v${pkgver}")
sha512sums=('SKIP')

build() {
  cd "${pkgname}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname}"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m pytest tests
}

package() {
  cd "${pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
