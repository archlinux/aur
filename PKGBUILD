# Maintainer: Jeremy M. Reed <reeje76@gmail.com>
pkgname=image-file-name-fixer
pkgver=0.0.6
pkgrel=2
pkgdesc="A tool to enforce a consistent naming scheme for image files."
arch=('x86_64')
url="https://github.com/jeremymreed/image-file-name-fixer"
license=('MIT')
depends=()
makedepends=('cargo' 'pandoc-cli')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jeremymreed/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('97a20811dc5c41d2f80b092c1aba573aa09742186383afdfaaf3912939f146432e972651355b255173c049db4b49f2269e0d149ff11b3d0f63f4d7b2c8ebe53b')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked
  pandoc manpage/${pkgname}.1.md -s -t man -o manpage/${pkgname}.1
}

check() {
  cd "$pkgname-$pkgver"

  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/${pkgname}" "$pkgdir/usr/bin/${pkgname}"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.md"
  install -Dm644 "manpage/${pkgname}.1" "$pkgdir/usr/share/man/man1/${pkgname}.1"
}

