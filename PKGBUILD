# Maintainer: MoetaYuko <loli at yuko dot moe>

_pkgname=jupytext
pkgname=python-$_pkgname
pkgver=1.16.4b
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
sha256sums=('711bff6395e8855fe3f5eed921df24c2b8c23c4134eb547d9947c9e77ed13851')

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
