# Maintainer: Hong Shick Pak <hong@hspak.com>

pkgname=zur
pkgver=0.9.0
pkgrel=1
pkgdesc="An AUR helper written in Zig"
arch=("x86_64")
url="https://github.com/hspak/zur"
license=("MIT")
depends=("pacman")
makedepends=("zig" "git")
provides=("$pkgname")
conflicts=("$pkgname" "$pkgname-git")
source=("https://github.com/hspak/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("283272c9a5781796a1df8817252c824ecf04c4b25661ba2ddf8536a6a08ed6a6")

build() {
  cd "${pkgname}-${pkgver}"
  zig build -Dversion="${pkgver}" --release=safe
}

check() {
  cd "${pkgname}-${pkgver}"
  zig-out/bin/zur --version
}

package() {
  cd "${pkgname}-${pkgver}"
  install -D -m 0755 "zig-out/bin/zur" "${pkgdir}/usr/bin/zur"
  install -D -m 0644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ft=sh syn=sh et
