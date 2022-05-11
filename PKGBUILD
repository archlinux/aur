# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=python-rtoml
pkgver=0.8
pkgrel=2
pkgdesc="A better TOML library for python implemented in rust."
arch=('x86_64')
url="https://pypi.org/project/rtoml"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-setuptools-rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/samuelcolvin/rtoml/archive/v$pkgver.tar.gz")
sha256sums=('6f7c47762b8a0e908633d8f2cdbbaddc4e79d7abc46ac555584c2f80657cb32c')
b2sums=('6798b81d7a2ff3000694ee2cdd200bd2d6483e1d0f487977b6b2ce61bdb493352893d1225c431c5bdcf8c05ead86645ff2698fc330c76d4a33d55f2dfbf96aaa')

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
