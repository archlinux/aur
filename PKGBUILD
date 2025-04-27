# Maintainer: MoetaYuko <loli at yuko dot moe>

_pkgname=jupytext
pkgname=python-$_pkgname
pkgver=1.17.1
pkgrel=1
pkgdesc="Jupyter notebooks as Markdown documents, Julia, Python or R scripts"
url="https://github.com/mwouts/jupytext"
depends=(
    jupyter-nbformat
    python-markdown-it-py
    python-mdit_py_plugins
    python-packaging
    python-toml
    python-yaml
)
makedepends=(
    jupyterlab
    npm
    python-build
    python-hatch-jupyter-builder
    python-hatchling
    python-installer
    python-jupyter-packaging
    python-setuptools
    python-wheel
)
optdepends=(
    jupyter-nbconvert
    jupyterlab
    python-sphinx-gallery
)
license=('MIT')
arch=('any')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('151acd4479d6015cedfea8fb3d6f1c270b9d90830b9279d65d9338fd3d2fc18b')

build() {
    cd $_pkgname-$pkgver
    HATCH_BUILD_HOOKS_ENABLE=true python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
    cd $_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:et:ts=4:sw=4
