# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-voila
_pkgname=${pkgname:7}
pkgver=0.4.3
pkgrel=2
pkgdesc="Voilà turns Jupyter notebooks into standalone web applications"
arch=('any')
url="https://voila.readthedocs.io"
license=(BSD)
makedepends=(python-build python-installer python-wheel python-jupyter_packaging)
depends=(
    python
    jupyter-server
    python-jupyterlab_server
    python-jupyter_client
    jupyter-nbclient
    jupyter-nbconvert
    jupyterlab
    jupyter-notebook
    jupyter-lsp
    python-websockets
    python-traitlets
    python-hatchling
    python-tinycss2
)
makedepends+=(
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
)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('18a5737cb84f961580b2bf7fa8d55bf110de6170591fc50286bafe01bbd2dce7')

prepare() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    sed -i 's|jupyterlab~=3.0|jupyterlab>=3.0|g' pyproject.toml
}

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
