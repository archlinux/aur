# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

pkgname=jupyterlab-quarto
pkgdesc="Quarto JupyterLab extension"
url="https://github.com/quarto-dev/jupyterlab-quarto"
pkgver=0.3.5
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        "install.json")
sha256sums=('efc9ca0cf5fd6439ed01228fe4e24cbca67edc7c3dc82dbe1baa67d6d2c6c974'
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
