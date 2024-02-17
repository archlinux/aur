# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

pkgname=jupyterlab-quarto
pkgdesc="Quarto JupyterLab extension"
url="https://github.com/quarto-dev/jupyterlab-quarto"
pkgver=0.3.3
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
  python-hatchling
  python-hatch-nodejs-version
  python-hatch-jupyter-builder
  python-jupyter-packaging
  npm
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "install.json")
sha256sums=('e3605eaf9a01d05ae52e4a164e9aba1ff2e7bfcc8dcad1e5ce33b42d1a067cdc'
            'c49c59e589a7ddd777edc3011ced74d9631114b682b6ad7695eef750e5af797b')

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
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
