# Maintainer: Avery Murray <averylapine@gmail.com>

_pkgname=proton-call
pkgname=proton-caller
__pkgname=Proton-Caller
pkgver=2.3.1
pkgrel=1
pkgdesc="Run any Windows program through Proton"
arch=('x86_64')
url="https://github.com/caverym/Proton-Caller/"
license=('MIT')
makedepends=('rust' 'gcc')
conflicts=(proton-caller-git)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/caverym/"$__pkgname"/archive/${pkgver}.tar.gz")
sha256sums=('70e1464e132d6790b86e60e562f5eabce0e42db64e18c89102c63127547d01a2')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable} cargo build --release --locked
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable} cargo test --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/proton-call "$pkgdir"/usr/bin/proton-call
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 proton.conf "pkgdir"/usr/share/proton-caller/example.conf
}
