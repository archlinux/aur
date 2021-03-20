# Maintainer: Daniel Eklöf <daniel at ekloef dot se>
pkgname=fuzzel
pkgver=1.5.1
pkgrel=4
pkgdesc="Application launcher for wlroots based Wayland compositors"
arch=('x86_64' 'aarch64')
url=https://codeberg.org/dnkl/${pkgname}
license=(mit)
makedepends=('meson' 'ninja' 'scdoc' 'tllist')
depends=('libxkbcommon' 'wayland' 'pixman' 'cairo' 'librsvg' 'libpng' 'fcft')
changelog=CHANGELOG.md
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=('8a7394a32664638c91e865d63cf5d5a34d8caf4594854ed4867afae1a6f38eb7')

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
