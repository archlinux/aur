# Maintainer: WilliamAnimate <nyameowmeow@duck.com>
# Maintainer: xan <xxdr@duck.com>
pkgname=encore
pkgver=0.2.0.canary.4
_pkgver=0.2.0-canary.4
pkgrel=1
pkgdesc="A lightweight TUI music player."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/WilliamAnimate/encore"
license=('MIT, Apache-2.0')
provides=("echotune")
makedepends=('cargo' 'git')
source=("git+https://github.com/WilliamAnimate/encore.git")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"
  git config --local advice.detachedHead false
  git checkout tags/v${_pkgver}
  git submodule update --remote --init --recursive
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=nightly
  cargo +nightly build --profile release
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/encore" "$pkgdir/usr/bin/encore"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-APACHE"
  install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-MIT"
}

