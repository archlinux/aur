# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

_pyname=rise
pkgname=jupyterlab-rise
pkgdesc="RISE: \"Live\" Reveal.js JupyterLab Slideshow Extension"
url="https://github.com/jupyterlab-contrib/rise"
pkgver=0.41.0
pkgrel=1
license=(BSD)
arch=(any)
depends=(jupyterlab python-hatchling python-hatch-nodejs-version)
makedepends=(python-build python-installer python-setuptools python-wheel
             python-jupyter-packaging python-hatch-jupyter-builder npm)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "install.json")
sha256sums=('9bcefaaedacda0cde21687209fa8348e6d3e2793a35d480bcd27862e2f942aed'
            '140fd4e44ebdc1d8d5a56c3f583d829dd316dd930e2c654c1abea4ffef62c8af')

prepare() {
  cd $_pyname-$pkgver

  # Replace uninstallation instructions with Arch-specific ones.
  cp ../install.json .
}

build() {
  cd $_pyname-$pkgver
  python -m build --no-isolation --wheel -x
}

package() {
  cd $_pyname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
