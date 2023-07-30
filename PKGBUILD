# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

pkgname=jupyterlab-pytutor
pkgdesc="Python Tutor extension for JupyterLab"
url="https://github.com/jupyterlab-contrib/jupyterlab-pytutor"
pkgver=0.1.1
pkgrel=1
license=('BSD')
arch=('any')

depends=('jupyterlab' 'python-hatchling' 'python-hatch-nodejs-version')
makedepends=(
  'python-build' 'python-installer' 'python-jupyter-packaging' 'python-hatch-jupyter-builder'
  'python-setuptools' 'python-wheel'
)

_pypi=jupyterlab_pytutor
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
  'install.json'
)
sha256sums=('9e94bf07b0afa50ed7fb349f6d3c7ddd2fc2a7f4dc939a445df9c8dd1f738e0a'
            '493d16c764f090a6c4350644dc29898a18aab83c95240c59f6b9d98b99e6f9db')

prepare() {
  cd "$_pypi-$pkgver"

  # Replace uninstallation instructions with Arch-specific ones.
  cp "$srcdir/install.json" .
}

build() {
  cd "$_pypi-$pkgver"

  python -m build --no-isolation --wheel -x
}

package() {
  cd "$_pypi-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
