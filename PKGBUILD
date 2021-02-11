# Maintainer: Avery Murray <averylapine@gmail.com>

pkgname=proton-caller-git
pkgver=2.0
pkgrel=1
pkgdesc="Run any Windows program through Proton"
arch=('x86_64')
url="https://github.com/caverym/Proton-Caller/"
license=('GPL3')
depends=(
  'steam'
)
makedepends=('git' 'rust' 'gcc')
provides=(proton-caller)
conflicts=(proton-caller)

source=("git+https://github.com/caverym/Proton-Caller.git")
sha256sums=('SKIP')

pkgver() {
  cd Proton-Caller
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd Proton-Caller
  RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable} cargo build --release --locked
}

check() {
  cd Proton-Caller
  RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable} cargo test --release --locked
}

package() {
  cd Proton-Caller
  install -Dm755 target/release/proton-call "$pkgdir"/usr/bin/proton-call
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 manual/proton-call.6 "$pkgdir"/usr/share/man/man6/proton-call.6
}
