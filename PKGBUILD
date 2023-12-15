# Maintainer: Daniel Eklöf <daniel at ekloef dot se>
pkgname=wbg
pkgver=1.1.0
pkgrel=2
pkgdesc="Wallpaper application for wlroots based Wayland compositors"
arch=('x86_64' 'aarch64')
url=https://codeberg.org/dnkl/${pkgname}
license=(mit)
makedepends=('meson' 'ninja' 'wayland-protocols' 'tllist')
depends=('wayland' 'pixman' 'libjpeg-turbo' 'libpng' 'libwebp')
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=('99ba57c7f51509384b29fa7d5d5a29b008209746aa7cde0ed6a9a2965236b6c7')

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
