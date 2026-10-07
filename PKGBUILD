# Maintainer: Sergei Slipchenko <faergeek@gmail.com>

pkgname=still
pkgver=0.1.0
pkgrel=1
pkgdesc="Freeze the screen of a Wayland compositor until a provided command exits"
arch=(x86_64 aarch64)
url="https://github.com/faergeek/still"
license=(MIT)
depends=(pixman wayland)
makedepends=(git meson scdoc wayland-protocols)
source=("$url/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('96a8c78902041519b787845a889e8204b76e430341c0ca77370aedb454c87558')

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
