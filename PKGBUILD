# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Chinmay Dalal <exu9qiu7p AT relay DOT firefox DOT com>
pkgname=zuban
pkgver=v0.1.1
pkgrel=1
pkgdesc="A Mypy-compatible Python Language Server built in Rust"
arch=("i686" "x86_64" "aarch64")
url="https://zubanls.com"
license=("AGPL-3.0-only")
depends=()
makedepends=(cargo python-build python-installer python-maturin)
source=("zuban::git+https://github.com/zubanls/zuban#tag=${pkgver}")
sha256sums=("SKIP")

prepare() {
  cd $pkgname
  git submodule update --init --recursive
}

build() {
  cd "${pkgname}/deploy/pypi/zuban"
  ./pre-maturin-build.sh
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}/deploy/pypi/zuban"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
