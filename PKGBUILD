# Maintainer: Hong Shick Pak <hong@hspak.com>

pkgname=brightnessztl
pkgver=0.4
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
sha256sums=('223cb78d9e5e99e1cfd3b93b3e340ea67c5c6a034f6621dd021dddd202a15435')

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
