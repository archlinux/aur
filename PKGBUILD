# Maintainer: Hong Shick Pak <hong@hspak.com>

pkgname=zur
pkgver=0.8.0
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
sha256sums=("d20066bb7db27e27a23f1105fe34702bdaea39b3364812c8d91531e6875fdd3a")

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
