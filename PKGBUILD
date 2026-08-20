# Maintainer: Hong Shick Pak <hong@hspak.com>

pkgname=zanger
pkgver=0.1.0
pkgrel=1
pkgdesc="A TUI file navigator written in Zig"
arch=("x86_64")
url="https://github.com/hspak/zanger"
license=("MIT")
depends=()
makedepends=("zig" "git")
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://github.com/hspak/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("ab005aa92f4ad6702711ff0df213f43738bd2bb03b44055417ed98b713a511d9")

build() {
  cd "${pkgname}-${pkgver}"
  zig build -Dversion="${pkgver}" --release=safe
}

check() {
  cd "${pkgname}-${pkgver}"
  zig-out/bin/zanger --version
}

package() {
  cd "${pkgname}-${pkgver}"
  install -D -m 0755 "zig-out/bin/zanger" "${pkgdir}/usr/bin/zanger"
  install -D -m 0644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ft=sh syn=sh et
