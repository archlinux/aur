# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-buildlog-consultant
_name=${pkgname#python-}
pkgver=0.0.34
pkgrel=2
pkgdesc="Build log parser and analyser"
arch=('x86_64')
url="https://github.com/jelmer/buildlog-consultant"
license=('GPL2')
depends=('python-debian' 'python-pyaml' 'python-requirements-parser')
makedepends=('python-build' 'python-installer' 'python-setuptools-rust' 'python-wheel')
checkdepends=('python-pytest')
optdepends=('python-openai')
source=("$_name-$pkgver.tar.gz::https://github.com/jelmer/buildlog-consultant/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b265a9aa95b4d3f707a4fabbd125319db336bb2eb160ab61aaaeed57cecb1c93')

prepare() {
  cd "$_name-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=nightly
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_name-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=nightly
  python -m build --wheel --no-isolation
}

#check() {
#  cd "$_name-$pkgver"
#  pytest
#}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
