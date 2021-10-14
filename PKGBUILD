# Maintainer: Hong Shick Pak <hong@hspak.com>

pkgname=brightnessztl
pkgver=0.3
pkgrel=1
pkgdesc="A CLI to control device backlight written in Zig"
arch=('x86_64')
url="https://github.com/hspak/brightnessztl"
license=('MIT')
depends=()
makedepends=('zig-git')
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://github.com/hspak/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('d24f5c2a3d26f311e6ece018bd718671b55394e3c21e8b7e44bc1657829df95d')

build() {
  cd "${pkgname}-${pkgver}"
  zig build -Drelease-safe=true
}

check() {
  cd "${pkgname}-${pkgver}"
  zig-out/bin/brightnessztl debug &>/dev/null
}

package() {
  cd "${pkgname}-${pkgver}"
  install -D -m 0755 "zig-out/bin/brightnessztl" "${pkgdir}/usr/bin/brightnessztl"
  install -D -m 0644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ft=sh syn=sh et
