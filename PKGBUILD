# Maintainer: t4k1t <t4k1t plus aur at protonmail dot com>

pkgname=byebyemenu
pkgver=0.4.0
pkgrel=1
pkgdesc="A minimal, customizable power menu for Wayland compositors. Written in Rust with GTK4."
arch=('x86_64')
url="https://github.com/t4k1t/byebyemenu"
license=('MIT')
depends=('gcc-libs' 'gtk4')
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/t4k1t/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('1d9a1fe0ea55fb957f0983192f5932c2774196ad09daeed2077140c886e2b8fe0cff76f7ddd7033dc41ec7bba0a3d37b8ed78761277366284ab5c4c685742311')
options=(!lto)

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/byebyemenu" "${pkgdir}/usr/bin/byebyemenu"

  # Documentation
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "docs/man/${pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}
