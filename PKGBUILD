# Maintainer: Jakub Klinkovský <lahwaacz cat archlinux dog org>

pkgname='python-bqscales'
_pkgname='bqscales'
pkgver='0.3.3'
pkgrel=2
pkgdesc="Grammar of Graphics Scales for bqplot"
url="https://github.com/bqplot/bqscales"
depends=(
    python
    python-hatchling
    jupyterlab
    jupyter-lsp
    python-ipywidgets
    python-numpy
    python-traitlets
    python-traittypes
)
makedepends=(
    python-build
    python-installer
    python-wheel
    python-jupyter_packaging
    python-fqdn
    python-webcolors
    python-isoduration
    python-jsonpointer
    python-uri-template
    python-rfc3339-validator
    python-rfc3986-validator
    python-jupyter-server-terminals
    python-hatch-jupyter-builder
    python-debugpy
    npm
)
license=('Apache')
arch=('any')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('4a59cdc387563b345e77020dde40b297de6a56a918f7640638c4b7132a2a9342')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    mv "$pkgdir/usr/etc" "$pkgdir"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
