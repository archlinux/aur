# Maintainer: Specter119 <spcter119 AT gmail.com>
# Maintainer: gökçe aydos <aur-2023 aydos.de>

pkgname=jupyterlab_code_formatter
pkgver=2.2.1
pkgrel=1
pkgdesc='A universal code formatter for JupyterLab.'
arch=(any)
url=https://pypi.org/project/${pkgname//_/-}
license=(MIT)
depends=(
    python
    jupyterlab
    jupyter-lsp

    # Additional optional deps from jsonschema probably due to https://github.com/jupyter/jupyter_events/blob/9b99f6718a3bb2686aab51e17f5c7ee276baf316/pyproject.toml#L31C4-L33C112
    python-fqdn
    python-rfc3986-validator
    python-rfc3339-validator
    python-webcolors
    python-uri-template
    python-jsonpointer
    python-isoduration

    python-types-python-dateutil
    python-terminado
    python-debugpy
)
makedepends=(python-{build,installer,wheel,hatch,hatch-jupyter-builder,hatch-nodejs-version})
optdepends=(autopep8 yapf python-isort python-black)
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('85322819da61f025ebc7c4a842979994fa812ad44c334fdb6ebb9ebad58dae08')

build() {
  cd $srcdir/$pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $srcdir/$pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  mv "$pkgdir"/usr/etc "$pkgdir"
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
