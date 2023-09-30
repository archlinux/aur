# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

pkgname=jupyterlab-pytutor
pkgdesc="Python Tutor extension for JupyterLab"
url="https://github.com/jupyterlab-contrib/jupyterlab-pytutor"
pkgver=0.2.0
pkgrel=2
license=(BSD)
arch=(any)
depends=(jupyterlab python-hatchling python-hatch-nodejs-version)
makedepends=(python-build python-installer python-setuptools python-wheel
             python-jupyter-packaging python-hatch-jupyter-builder npm)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'install.json')
sha256sums=('f21f24217649b6d9f848f6fb4d4928f64413eb01a6717a6697961805f2e63e1b'
            '493d16c764f090a6c4350644dc29898a18aab83c95240c59f6b9d98b99e6f9db')

prepare() {
  cd "$pkgname-$pkgver"

  # Replace uninstallation instructions with Arch-specific ones.
  cp "$srcdir/install.json" .
}

build() {
  cd "$pkgname-$pkgver"
  python -m build --no-isolation --wheel --skip-dependency-check
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
