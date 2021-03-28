# Maintainer: Hong Shick Pak <hong@hspak.com>

pkgname=brightnessztl
pkgver=0.2
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
sha256sums=('47d26b586e98bb9d5fe59553b81ad5a4bd2eafa9820e5dafd527593740492101')

build() {
  cd "${pkgname}-${pkgver}"
  zig build -Drelease-safe=true
}

check() {
  cd "${pkgname}-${pkgver}"
  zig-cache/bin/brightnessztl debug &>/dev/null
}

package() {
  cd "${pkgname}-${pkgver}"
  install -D -m 0755 "zig-cache/bin/brightnessztl" "${pkgdir}/usr/bin/brightnessztl"
  install -D -m 0644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ft=sh syn=sh et
