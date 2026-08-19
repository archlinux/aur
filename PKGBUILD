# Maintainer: Hong Shick Pak <hong@hspak.com>

pkgname=zur
pkgver=0.8.1
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
sha256sums=("2add9f624ccffd6f719e0d92357d3cafad7a9ce7e52d4ca28698a46e99fb1dd5")

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
