# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

_pyname=jupyterlab_autosave_on_focus_change
pkgname=jupyterlab-autosave-on-focus-change
pkgdesc="JupyterLab extension to autosave files on focus change"
url="https://github.com/s-weigand/jupyterlab_autosave_on_focus_change"
pkgver=0.4.0
pkgrel=1
license=(BSD-3-Clause)
arch=(any)
depends=(
  jupyterlab
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
  python-jupyter-packaging
  python-hatchling
  python-hatch-nodejs-version
  python-hatch-jupyter-builder
  npm
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "install.json")
sha256sums=('d092c0eaadf17288990b47c690be76cc2a0133d3d70db631d2c15ae7040b14d5'
            '5ae4dc788e815001de85448b35358ab5e3b8862ce7029cca4288c8a8227bb98b')

prepare() {
  cd $_pyname-$pkgver

  # Replace uninstallation instructions with Arch-specific ones.
  cp ../install.json .
}

build() {
  cd $_pyname-$pkgver
  python -m build --no-isolation --wheel --skip-dependency-check
}

package() {
  cd $_pyname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
