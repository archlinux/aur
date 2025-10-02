# Maintainer: Sergei Slipchenko <faergeek@gmail.com>

pkgname=still
pkgver=0.0.2
pkgrel=1
pkgdesc="Freeze the screen of a Wayland compositor until a provided command exits"
arch=(x86_64 aarch64)
url="https://github.com/faergeek/still"
license=(MIT)
depends=(wayland)
makedepends=(git meson wayland-protocols)
source=("$url/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('a9b21c600b10a0c7aa59f7dc8ce9e2de7510dcbf65e6f6fd8b982181c719e937')

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
