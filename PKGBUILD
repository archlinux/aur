# Maintainer: Raz <real.raz.dev@gmail.com>

pkgname=python-raztodo
pkgver=0.2.1
pkgrel=1
pkgdesc="A fast, minimal dependency command-line todo/task manager backed by SQLite."
url="https://github.com/razbuild/raztodo"
arch=('any')
license=('MIT')
depends=('python' 'python-raztint')
checkdepends=('python-pytest')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
options=('!emptydirs')
source=("python-raztodo-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('4a6201584d54d693c74bd50e768bed44fac19da6225d433c07985b59166f5a67')

build() {
    cd "${srcdir}/raztodo-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/raztodo-${pkgver}"
  export PYTHONPATH="$PWD/src:$PYTHONPATH"
  python -m pytest tests
}

package() {
    cd "${srcdir}/raztodo-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}