# Maintainer: Jeremy M. Reed <reeje76@gmail.com>
pkgname=image-file-name-fixer
pkgver=0.0.6
pkgrel=1
pkgdesc="A tool to enforce a consistent naming scheme for image files."
arch=('x86_64')
url="https://github.com/jeremymreed/image-file-name-fixer"
license=('MIT')
depends=()
makedepends=('cargo' 'pandoc-cli')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jeremymreed/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('b58ae405f2141dfd97dad27250b248e8a2066daf0d61626e40d12549d3edf548c4a01850a5cc2820b284dd5f37823cb4f1b03528170850528e6b202715ddef9f')

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

