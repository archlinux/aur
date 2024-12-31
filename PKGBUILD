# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

_pyname=rise
pkgname=jupyterlab-rise
pkgver=0.43.1
pkgrel=1
pkgdesc="RISE: \"Live\" Reveal.js JupyterLab Slideshow Extension"
arch=(any)
url="https://github.com/jupyterlab-contrib/rise"
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "install.json")
sha256sums=('95e4b8c9f6c492e94030ddee214a20a6708a6c843d5f9f86b2c7007a83039db1'
            '140fd4e44ebdc1d8d5a56c3f583d829dd316dd930e2c654c1abea4ffef62c8af')

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
