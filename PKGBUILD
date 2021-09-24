# Maintainer: Daniel Eklöf <daniel at ekloef dot se>
pkgname=fuzzel
pkgver=1.6.3
pkgrel=1
pkgdesc="Application launcher for wlroots based Wayland compositors"
arch=('x86_64' 'aarch64')
url=https://codeberg.org/dnkl/${pkgname}
license=(mit)
makedepends=('meson' 'ninja' 'scdoc' 'wayland-protocols' 'tllist')
depends=('libxkbcommon' 'wayland' 'pixman' 'cairo' 'librsvg' 'libpng' 'fcft')
changelog=CHANGELOG.md
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=('5debf6e7cfad8f7b21fbf7c5c2f4f22bd9f6f8273f4b658def4fce70e8c4a3a0')

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
