# Maintainer: Hong Shick Pak <hong@hspak.com>

pkgname=brightnessztl
pkgver=0.1
pkgrel=3
pkgdesc="A CLI to control device backlight written in Zig"
arch=('x86_64')
url="https://github.com/hspak/brightnessztl"
license=('MIT')
depends=()
makedepends=('zig-git')
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://github.com/hspak/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('ada71f5c0181a979855d50b2b61eb85e780aae88b5421ceefb689d1e04b0049d')

build() {
  cd "${pkgname}-${pkgver}"
  zig build
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
