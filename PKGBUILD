# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=python-rtoml
pkgver=0.8
pkgrel=1
pkgdesc="A better TOML library for python implemented in rust."
arch=('x86_64')
url="https://pypi.org/project/rtoml"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-setuptools-rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/samuelcolvin/rtoml/archive/v$pkgver.tar.gz")
sha256sums=('6a5c6f0c1dd956276cccd331aabfd0593588d8dbb29714ae5d89dd5583f846c4')
b2sums=('a0f3c9a6126357e37bf49325da24a1918d7b3fb0a7e3a05b938448deb9b922359880832dca3dd51b50fa3c1cbaf3c03a13daff184b7ebc9bc4550694602fff27')

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
