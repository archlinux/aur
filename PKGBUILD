# Maintainer: Sergei Slipchenko <faergeek@gmail.com>

pkgname=still
pkgver=0.0.5
pkgrel=1
pkgdesc="Freeze the screen of a Wayland compositor until a provided command exits"
arch=(x86_64 aarch64)
url="https://github.com/faergeek/still"
license=(MIT)
depends=(pixman wayland)
makedepends=(git meson scdoc wayland-protocols)
source=("$url/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('2051a3c8a336d83466b76e3b44a28452931e518d0ef9710e1e506ab4c8890f88')

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
