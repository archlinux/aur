# Maintainer: AltoXorg <machinademoniko@gmail.com>

_reponame=crunch64
pkgname=${_reponame}-cli
pkgver=0.5.3
pkgrel=1
pkgdesc="A utility for compressing/decompressing files with common n64 formats"
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/decompals/crunch64"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("${_reponame}-${pkgver}.tar.gz::https://github.com/decompals/${_reponame}/archive/${pkgver}.tar.gz")
sha512sums=('61787f02874829935e7532146204a7d2d6fb415a6800840d697aa3c2b2ab58782307e07d25712dfab0a8bdd43d748d4b58aead3cde4b28862035209f558137c8')

prepare() {
  cd "${_reponame}-${pkgver}"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${_reponame}-${pkgver}"

  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "${_reponame}-${pkgver}"

  cargo test --frozen --all-features
}

package() {
  cd "${_reponame}-${pkgver}"

  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${_reponame}"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" "LICENSE"
}
