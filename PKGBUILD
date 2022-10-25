# Maintainer: Daniel Eklöf <daniel at ekloef dot se>
pkgname=wbg
pkgver=1.1.0
pkgrel=1
pkgdesc="Wallpaper application for wlroots based Wayland compositors"
arch=('x86_64' 'aarch64')
url=https://codeberg.org/dnkl/${pkgname}
license=(mit)
makedepends=('meson' 'ninja' 'wayland-protocols' 'tllist')
depends=('wayland' 'pixman' 'libjpeg-turbo' 'libpng' 'libwebp')
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=('3f7844914c8a53fababa5df3575a9adb06026932bdd359664077ffdf19aae917')

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
