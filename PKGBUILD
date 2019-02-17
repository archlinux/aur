# Maintainer: Ivan Molodetskikh <yalterz@gmail.com>
pkgname=wl-clipboard-rs-git
pkgver=0.2.r0.gee298eb5
pkgrel=1
pkgdesc="A safe Rust reimplementation of the Wayland command-line copy/paste utilities"
arch=('x86_64')
url="https://github.com/YaLTeR/wl-clipboard-rs"
license=('MIT' 'APACHE')
depends=('gcc-libs')
makedepends=('git' 'cargo')
provides=('wl-clipboard')
conflicts=('wl-clipboard')
source=("$pkgname::git+https://github.com/YaLTeR/wl-clipboard-rs")
sha1sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"

  cargo build --release
}

package() {
  cd "$pkgname"

  install -Dm755 "target/release/wl-copy" "$pkgdir/usr/bin/wl-copy"
  install -Dm755 "target/release/wl-paste" "$pkgdir/usr/bin/wl-paste"
  install -Dm755 "target/release/wl-clip" "$pkgdir/usr/bin/wl-clip"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-APACHE"
  install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
