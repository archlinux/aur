# Maintainer: Daniel Eklöf <daniel at ekloef dot se>
pkgname=wbg
pkgver=1.0.2
pkgrel=4
pkgdesc="Wallpaper application for wlroots based Wayland compositors"
arch=('x86_64' 'aarch64')
url=https://codeberg.org/dnkl/${pkgname}
license=(mit)
makedepends=('meson' 'ninja' 'wayland-protocols' 'tllist')
depends=('wayland' 'pixman' 'libjpeg-turbo' 'libpng')
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=('3afcad17233ae3120369eaaf54bde41be8629bcda375d75a2d0d893649e802bc')

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
