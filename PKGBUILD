# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

_pypi=jupyterlab_pytutor
pkgname=jupyterlab-pytutor
pkgdesc="Python Tutor extension for JupyterLab"
url="https://github.com/jupyterlab-contrib/jupyterlab-pytutor"
pkgver=0.2.0
pkgrel=1
license=('BSD')
arch=('any')
depends=('jupyterlab' 'python-hatchling' 'python-hatch-nodejs-version')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel'
             'python-jupyter-packaging' 'python-hatch-jupyter-builder')
source=("https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
        'install.json')
sha256sums=('62b0cd747109e4a7b8cdf8323194909537c10fcfceb4c8eb33ecc0dde3002562'
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
