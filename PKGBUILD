# Maintainer: Hong Shick Pak <hong@hspak.com>

pkgname=brightnessztl
pkgver=0.6
pkgrel=1
pkgdesc="A CLI to control device backlight written in Zig"
arch=('x86_64')
url="https://github.com/hspak/brightnessztl"
license=('MIT')
depends=('systemd-libs')
makedepends=('zig')
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://github.com/hspak/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('8d36da69c5fcbcc886a4967487b533d623e619a3dc035e78764fb2816217112d')

build() {
  cd "${pkgname}-${pkgver}"
  zig build -Doptimize=ReleaseSafe
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
