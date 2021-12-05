# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=python-rtoml
pkgver=0.7.1
pkgrel=1
pkgdesc="A better TOML library for python implemented in rust."
arch=('x86_64')
url="https://pypi.org/project/rtoml"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-setuptools-rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/samuelcolvin/rtoml/archive/v$pkgver.tar.gz")
sha256sums=('5200b182d1287acf0f3792498a997ef3b4777a70410fd463971dcf1270938fb6')
b2sums=('c641254108eab1c5e0c0e202a8f0ab9d2a04754b6defaf4e80f5dbdbb55b90d5491826a26cfa4f508001d7caf42d18246ee90c28f734585c97032bdad5a66c9b')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

prepare() {
  cd "rtoml-$pkgver"

  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "rtoml-$pkgver"

  python setup.py build
}

check() {
  cd "rtoml-$pkgver"

  export PYTHONPATH="build/lib"
  python setup.py test
}

package() {
  cd "rtoml-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
