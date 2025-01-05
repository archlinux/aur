# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Contributor:  Christian Holme <hcmh (at) kolabnow (dot) com>

_name=bash_kernel
pkgname=jupyter-${_name}
pkgver=0.10.0
pkgrel=1
pkgdesc="A bash kernel for Jupyter"
arch=(any)
url="https://github.com/takluyver/bash_kernel"
license=(BSD-3-Clause)
depends=(
  bash
  python-debugpy
  python-filetype
  python-ipykernel
  python-pexpect
)
makedepends=(
  python-build
  python-installer
  python-flit-core
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('9be956d3a7f3a22aaffec8f51f805e9409a220e44904cf051be67f61c3fe006811f2b3256ea934eb331bcd64900154e99406799ffef16afc0dc6b7bd9dbf7b06')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  python -m bash_kernel.install --prefix="$pkgdir"/usr
}
