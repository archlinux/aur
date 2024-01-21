# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-buildlog-consultant
_name=${pkgname#python-}
pkgver=0.0.35
pkgrel=1
pkgdesc="Build log parser and analyser"
arch=('x86_64')
url="https://github.com/jelmer/buildlog-consultant"
license=('GPL-2.0-or-later')
depends=('python-debian' 'python-pyaml' 'python-requirements-parser')
makedepends=('python-build' 'python-installer' 'python-setuptools-rust' 'python-wheel')
optdepends=('python-openai')
source=("$_name-$pkgver.tar.gz::https://github.com/jelmer/buildlog-consultant/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8cbd31b3785d2bc607ab8fc34a8a0308b0f65ba31f6400996cec796584edcd27')

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

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
