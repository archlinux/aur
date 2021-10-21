# Maintainer: Hong Shick Pak <hong@hspak.com>

pkgname=zur
pkgver=0.6.1
pkgrel=2
pkgdesc="An AUR helper written in Zig"
arch=("x86_64")
url="https://github.com/hspak/zur"
license=("MIT")
depends=("pacman" "curl")
makedepends=("zig" "git")
provides=("$pkgname")
conflicts=("$pkgname" "$pkgname-git")
source=("https://github.com/hspak/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("63f8f0719bc4335f82151b5940ca0d755029e6aec28fac0107b2d11d56662a21")

build() {
  cd "${pkgname}-${pkgver}"
  zig build -Dversion="${pkgver}" -Drelease-safe=true
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
