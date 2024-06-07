# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ognibuild
pkgver=0.0.20
pkgrel=1
pkgdesc="Detect and invoke build systems"
arch=('x86_64')
url="https://github.com/jelmer/ognibuild"
license=('GPL-2.0-or-later')
depends=(
  'breezy'
  'python-buildlog-consultant'
  'python-requirements-parser'
  'python-ruamel-yaml'
  'python-setuptools'
  'python-toml'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools-rust'
  'python-wheel'
)
optdepends=(
  'python-aiohttp-openmetrics'
  'python-apt'
#  'python-brz-debian'
  'python-debian'
  'python-debmutate'
  'python-lz4'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/jelmer/ognibuild/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('21a8ac9a410e1dfb44e9931e02350c75ddf49b5c50422e2068cb7aba46006a2c')

prepare() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
