# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

_pyname=jupyterlab_autosave_on_focus_change
pkgname=jupyterlab-autosave-on-focus-change
pkgver=0.4.1
pkgrel=2
pkgdesc="JupyterLab extension to autosave files on focus change"
arch=(any)
url="https://github.com/s-weigand/jupyterlab_autosave_on_focus_change"
license=(BSD-3-Clause)
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
b2sums=('53d7e25ac4c855c47db44571adc85b2320459297c7084ddb03a896b7797f4386bb3b281cc793e2eca0944fff157a41bec4a79562ea1414afda88def52bd83f74'
        '0bf96e28bc9a1a0c7999310c23c1fca281482cc45a9c90dd1b50c126b6f2af0b77fbfab0fd2926ace9d83fa2797e3ecb050377274a4f786b97021015aec32da4')

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
