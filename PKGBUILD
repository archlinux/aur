# Maintainer: WilliamAnimate <nyameowmeow@duck.com>
# Maintainer: xan <xxdr@duck.com>
pkgname=echotune
pkgver=0.1.0rc3
_pkgver=0.1.0-rc3
pkgrel=2
pkgdesc="A lightweight TUI music player."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/WilliamAnimate/echotune"
license=('MIT, Apache-2.0')
provides=("echotune")
makedepends=('cargo' 'git')
source=("git+https://github.com/WilliamAnimate/echotune.git")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"
  git config --local advice.detachedHead false
  git checkout tags/v${_pkgver}
  git submodule update --remote --init --recursive
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --profile release
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/echotune" "$pkgdir/usr/bin/echotune"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-APACHE"
  install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
