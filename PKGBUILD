# Maintainer: Daniel Eklöf <daniel at ekloef dot se>
pkgname=fuzzel
pkgver=1.6.1
pkgrel=1
pkgdesc="Application launcher for wlroots based Wayland compositors"
arch=('x86_64' 'aarch64')
url=https://codeberg.org/dnkl/${pkgname}
license=(mit)
makedepends=('meson' 'ninja' 'scdoc' 'wayland-protocols' 'tllist')
depends=('libxkbcommon' 'wayland' 'pixman' 'cairo' 'librsvg' 'libpng' 'fcft')
changelog=CHANGELOG.md
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=('43d809858a7f093d8f10e48371c806409bd3a57e5d9021a6912cd90bfbee5b4d')

build() {
  cd ${pkgname}

  meson --prefix=/usr --buildtype=release . build
  ninja -C build
}

package() {
  cd ${pkgname}
  DESTDIR="${pkgdir}/" ninja -C build install
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
