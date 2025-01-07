# Maintainer: somini <dev@somini.xyz>
# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=python-lunr
_pkgname=lunr.py
pkgver=0.7.0
pkgrel=1
pkgdesc="A Python implementation of Lunr.js (for mkdocs)"
arch=('any')
url="https://github.com/yeraydiazdiaz/lunr.py"
license=('MIT')
depends=()
makedepends=(
    python-build python-installer python-wheel
    python-hatchling python-hatch-vcs python-hatch-fancy-pypi-readme
)
optdepends=('python-nltk: extra languages support')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('3125d17bbe966315a1a10eab8867768fbf4cb5e3efaebda8a9a9a39f7cc6861d')

build() {
    cd "$_pkgname-$pkgver"
    SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" \
        python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
