# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Contributor:  Christian Holme <hcmh (at) kolabnow (dot) com>

_name=bash_kernel
pkgname=jupyter-${_name}
pkgver=0.9.3
pkgrel=2
pkgdesc="A bash kernel for Jupyter"
arch=(any)
url="https://github.com/takluyver/bash_kernel"
license=(BSD-3-Clause)
depends=(
  bash
  python-pexpect
  python-ipykernel
  python-debugpy
)
makedepends=(
  python-build
  python-installer
  python-flit-core
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('2d1cf609594fc4333d74821b69c5df685c3f8ecf908ad4a0ad7411118a46b4046817ef5c166aac0fbc28c9a54d28ca1fa614f00194d5ad7b7d4c630cdcc92301')

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
