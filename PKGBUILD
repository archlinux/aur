# Maintainer: fuero <fuerob@gmail.com>

pkgname=zwanzig
pkgver=0.15.1
pkgrel=1
pkgdesc='A linter for the Zig programming language'
arch=(x86_64)
url=https://github.com/forketyfork/zwanzig
license=(MIT)
makedepends=('zig')
depends=('glibc')
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  'build-with-pie.patch'
)
sha256sums=('e788c1430fbdc9f3694436097c5dda85fa7d6516cf4bca446fd343c11c791b21'
            '2801483d4b790b7eb5fdf3c8a3593cc0e9ebda9d79a1605614cb532b63180236')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -p0 < "${srcdir}/build-with-pie.patch"
}

build() {
  cd "${pkgname}-${pkgver}"
  zig build --release=safe
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 zig-out/bin/${pkgname} -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE \
    -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
