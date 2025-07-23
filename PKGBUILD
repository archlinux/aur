# Maintainer: Daniel Eklöf <daniel at ekloef dot se>
pkgname=wbg
pkgver=1.3.0
pkgrel=1
pkgdesc="Wallpaper application for wlroots based Wayland compositors"
arch=('x86_64' 'aarch64')
url=https://codeberg.org/dnkl/${pkgname}
license=(mit)
makedepends=('meson' 'ninja' 'wayland-protocols' 'tllist')
depends=('wayland' 'pixman' 'libjpeg-turbo' 'libpng' 'libwebp')
source=(${url}/releases/download/${pkgver}/wbg-${pkgver}.tar.gz
        ${url}/releases/download/${pkgver}/wbg-${pkgver}.tar.gz.sig)
sha256sums=('5e23555c599e58f8fc76f2f8a697149c9fe96702a337a3e0457d503becb307a5'
            'SKIP')
validpgpkeys=('B19964FBBA09664CC81027ED5BBD4992C116573F')

build() {
  cd ${pkgname}-${pkgver}

  meson --prefix=/usr --buildtype=release . build
  ninja -C build
}

package() {
  cd ${pkgname}-${pkgver}
  DESTDIR="${pkgdir}/" ninja -C build install
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
