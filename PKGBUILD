# Maintainer: Sergei Slipchenko <faergeek@gmail.com>

pkgname=still
pkgver=0.0.1
pkgrel=1
pkgdesc="Freeze the screen of a Wayland compositor until a provided command exits"
arch=(x86_64 aarch64)
url="https://github.com/faergeek/still"
license=(MIT)
depends=(wayland)
makedepends=(git meson wayland-protocols)
source=("$url/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('f0fafd59b13e3fd33d3a69d55ed70f319f75b45ad80d9a80930bc2c97d5e8698')

build() {
  cd "${pkgname}-${pkgver}"
  arch-meson build
  ninja -C build
}

package() {
  cd "${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
