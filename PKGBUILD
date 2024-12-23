# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-kornia-rs
_pkgname=kornia-rs
pkgver=0.1.7
pkgrel=5
pkgdesc="A low level computer vision library in Rust"
arch=("x86_64")
url="https://github.com/kornia/kornia-rs"
license=("Apache-2.0")
options=(!lto)
depends=(python cargo gstreamer gst-plugins-base-libs python-pytorch)
makedepends=(git rust cmake python-installer python-build python-wheel python-maturin python-packaging python-setuptools nasm)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/kornia/kornia-rs/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('547a01735791de4afcfcd6e01de8a72bca5539c3b88857770edaa9d45b7bd728')

build() {
  cd "$_pkgname-$pkgver/kornia-py"
  PYO3_USE_ABI3_FORWARD_COMPATIBILITY=1 python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" kornia-py/dist/*.whl
  # Install documentation
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
}

# vim:set ts=2 sw=2 et:
