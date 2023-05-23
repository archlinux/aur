# Maintainer: Jeremy M. Reed <reeje76@gmail.com>
pkgname=image-file-name-fixer
pkgver=0.0.3
pkgrel=2
pkgdesc="A tool to enforce a consistent naming scheme for image files."
arch=('x86_64')
url="https://github.com/jeremymreed/image-file-name-fixer"
license=('MIT')
depends=()
makedepends=('cargo' 'pandoc-cli')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jeremymreed/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('5f7283ea3e11939d5ec266fbce6fb8b02f05a3f63603c33bb60024ef51bc5107fcdd805f0a1ed64a9f75edf8a0ceddeb11679be77be60aaf14b1ba69234cd268')

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

