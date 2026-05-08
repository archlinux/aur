# Maintainer: jinzhongjia <mail@nviemr.org>
pkgname=zt
pkgver=0.8.0
pkgrel=1
pkgdesc="Minimal terminal emulator in Zig (X11 backend, no GPU required)"
arch=('x86_64' 'aarch64')
url="https://github.com/midasdf/zt"
license=('MIT')
depends=(
  'libxcb'
  'xcb-imdkit'
  'libxkbcommon'
  'libxkbcommon-x11'
)
makedepends=('zig>=0.16.0')
provides=("${pkgname}=${pkgver}")
options=(!lto)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9b202a5ef9981f03bb5cfb9c724eaee8f7a4cc76c42d5e165f89394606b090be')

build() {
  cd "${pkgname}-${pkgver}"
  zig build \
    -Dbackend=x11 \
    -Doptimize=ReleaseFast \
    -Dstrip=true \
    --prefix "${srcdir}/install" \
    --cache-dir "${srcdir}/.zig-cache" \
    --global-cache-dir "${srcdir}/.zig-global-cache" \
    --summary all
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "${srcdir}/install/bin/zt" "${pkgdir}/usr/bin/zt"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
