# Maintainer: Avery Murray <averylapine@gmail.com>

_pkgname=proton-call
pkgname=proton-caller
__pkgname=Proton-Caller
pkgver=3.0.1
pkgrel=2
pkgdesc="Run any Windows program through Proton"
arch=('x86_64')
url="https://github.com/caverym/Proton-Caller/"
license=('MIT')
makedepends=('rust' 'gcc')
conflicts=(proton-caller-git)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/caverym/"$__pkgname"/archive/${pkgver}.tar.gz")
sha256sums=('5fb27cd1c76fcc0e1fca38f920a33f9d982fde625e08f844fd32fc2a89c3e310')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable} cargo build --release
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable} cargo test --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/proton-call "$pkgdir"/usr/bin/proton-call
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 proton.conf "$pkgdir"/usr/share/proton-caller/example.conf
}
