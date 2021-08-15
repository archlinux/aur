# Maintainer: Daniel Eklöf <daniel at ekloef dot se>
pkgname=fuzzel
pkgver=1.6.2
pkgrel=1
pkgdesc="Application launcher for wlroots based Wayland compositors"
arch=('x86_64' 'aarch64')
url=https://codeberg.org/dnkl/${pkgname}
license=(mit)
makedepends=('meson' 'ninja' 'scdoc' 'wayland-protocols' 'tllist')
depends=('libxkbcommon' 'wayland' 'pixman' 'cairo' 'librsvg' 'libpng' 'fcft')
changelog=CHANGELOG.md
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=('55b7eea342cc0cef8cd40756c7ef2ca30eebc462081d445375a43c9ae5c8555f')

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
