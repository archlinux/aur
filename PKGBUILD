# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=xsetwallpaper
pkgver=0.1.1
pkgrel=1
pkgdesc='Wallpaper setting utility for X'
url='https://github.com/stoeckmann/xsetwallpaper'
arch=('i686' 'x86_64')
license=('ISC')
depends=('pixman' 'libpng' 'xcb-util' 'xcb-util-image' 'libjpeg-turbo')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/stoeckmann/xsetwallpaper/archive/v${pkgver}.tar.gz)
sha256sums=('a88bf1b77e1a0ea00873a3f09f179a5f3dac79cbab4ebe4f852a219a0938d5e2')
sha512sums=('9c285eb51c9fe8cd9e58859731863999a7a851502940a544740078a15783a98b6bdc48bcfb1bc6f7e32f2132b2fcc4b6cad7194c52d178a5a1b270dfc47403c1')

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
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
