# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

pkgname=jupyterlab-quarto
pkgver=0.3.5
pkgrel=2
pkgdesc="Quarto JupyterLab extension"
arch=(any)
url="https://github.com/quarto-dev/jupyterlab-quarto"
license=(BSD-3-Clause)
depends=(
  jupyterlab
)
makedepends=(
  npm
  python-build
  python-hatch-jupyter-builder
  python-hatch-nodejs-version
  python-hatchling
  python-installer
  python-jupyter-packaging
  python-setuptools
  python-wheel
)
source=(
  $pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz
  install.json
)
b2sums=('1d5e2445a2f0a48508a4520e7b5bd48e2d6770cd2ffde5cd5f69a6f63031b162969ff5d175d46776b65e71b848d441ea78ec0c16658e2138bdc14c0b3dc3bfe0'
        'fe8609e84cedae1327301efdcc951e1b04f7ccc3942295c5aa2ab4ed468f8ff3ca3776f3f69c4bcb6f249107ef358151bae2eec33143cbe8aa4d6df0ab0531da')

prepare() {
  cd $pkgname-$pkgver

  # Replace uninstallation instructions with Arch-specific ones.
  cp ../install.json .
}

build() {
  cd $pkgname-$pkgver
  python -m build --no-isolation --wheel --skip-dependency-check
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
