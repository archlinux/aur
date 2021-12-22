# Maintainer: Avery Murray <averylapine@gmail.com>

pkgname=proton-caller-git
pkgver=3.0.1.r0.g9874d3b
pkgrel=1
pkgdesc="Run any Windows program through Proton"
arch=('x86_64')
url="https://github.com/caverym/Proton-Caller/"
license=('GPL3')
depends=()
makedepends=('git' 'rust' 'gcc')
provides=(proton-caller)
conflicts=(proton-caller)

source=("git+https://github.com/caverym/Proton-Caller.git")
sha256sums=('SKIP')

validgpgkeys=('CE12C7A298605A16')

pkgver() {
  cd Proton-Caller
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd Proton-Caller
  RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable} cargo build --release
}

check() {
  cd Proton-Caller
  RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable} cargo test --release
}

package() {
  cd Proton-Caller
  install -Dm755 target/release/proton-call "$pkgdir"/usr/bin/proton-call
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 proton.conf "$pkgdir"/usr/share/proton-caller/example.conf
}
