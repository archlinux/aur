# Maintainer: Avery Murray <averylapine@gmail.com>

_pkgname=proton-call
pkgname=proton-caller
__pkgname=Proton-Caller
pkgver=2.3.0
pkgrel=3
pkgdesc="Run any Windows program through Proton"
arch=('x86_64')
url="https://github.com/caverym/Proton-Caller/"
license=('MIT')
makedepends=('rust' 'gcc')
conflicts=(proton-caller-git)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/caverym/"$__pkgname"/archive/${pkgver}.tar.gz")
sha256sums=('73908fc8fd3e4ed8cf532be5569b36f244f4b2ddd905748a2b844f49f94ab638')

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
