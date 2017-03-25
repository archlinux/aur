# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=xsetwallpaper
pkgver=0.1.0
pkgrel=1
pkgdesc='Wallpaper setting utility for X'
url='https://github.com/stoeckmann/xsetwallpaper'
arch=('i686' 'x86_64')
license=('ISC')
depends=('pixman' 'libpng' 'xcb-util' 'xcb-util-image' 'libjpeg-turbo')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/stoeckmann/xsetwallpaper/archive/v${pkgver}.tar.gz)
sha256sums=('69aab3ec17822d381156656831ec21e3c202ac6d319ab17eab396d5cc76c5b34')
sha512sums=('a3179ca753a8d7244e163088c17e11ce3278c9b800f064de70a4eeacec2b3b64605be16fc3d7dc4ce63cda57245b74c0b09243d845423992d43ec9d70abe6d81')

prepare() {
  cd ${pkgname}-${pkgver}
  autoreconf -fiv
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
