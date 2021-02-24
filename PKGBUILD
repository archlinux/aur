# Maintainer: Avery Murray <averylapine@gmail.com>

_pkgname=proton-call
pkgname=proton-caller
__pkgname=Proton-Caller
pkgver=2.2.1
pkgrel=1
pkgdesc="Run any Windows program through Proton"
arch=('x86_64')
url="https://github.com/caverym/Proton-Caller/"
license=('GPL3')
depends=('steam')
makedepends=('rust' 'gcc')
conflicts=(proton-caller-git)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/caverym/"$__pkgname"/archive/${pkgver}.tar.gz")
sha256sums=('29b47c1015de3a5f80fef5833ecc09fd8acc617ddf7cbc398557197e53a8702c')

build() {
  cd "$srcdir/$__pkgname-$pkgver"
  RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable} cargo build --release --locked
}

check() {
  cd "$srcdir/$__pkgname-$pkgver"
  RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable} cargo test --release --locked
}

package() {
  cd "$srcdir/$__pkgname-$pkgver"
  install -Dm755 target/release/proton-call "$pkgdir"/usr/bin/proton-call
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 manual/proton-call.6 "$pkgdir"/usr/share/man/man6/proton-call.6
}
