# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
pkgname=pipdeptree
pkgver=4.1.0
pkgrel=2
pkgdesc="Command line utility to show dependency tree of Python packages"
arch=('x86_64')
url="https://github.com/tox-dev/pipdeptree"
license=('MIT')
depends=(
  'glibc'
  'libgcc'
  'python'
  'python-graphviz'
  'python-rich'
  'python-typing_extensions'
)
makedepends=(
  'cargo'
  'meson-python'
  'python-build'
  'python-installer'
  'python-ninja'
  'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c775456f7b544138bf920cae79072aa6654688ff03c7b674fdfeaaffb5993de7')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target host-tuple
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
