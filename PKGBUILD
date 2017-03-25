# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=xsetwallpaper-git
pkgver=0.1.0+4+g9e04d1f
pkgrel=1
pkgdesc='Wallpaper setting utility for X'
url='https://github.com/stoeckmann/xsetwallpaper'
arch=('i686' 'x86_64')
license=('ISC')
depends=('pixman' 'libpng' 'xcb-util' 'xcb-util-image' 'libjpeg-turbo')
makedepends=('git')
provides=('xsetwallpaper')
conflicts=('xsetwallpaper')
source=(${pkgname}::git+https://github.com/stoeckmann/xsetwallpaper)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --tags|sed 's|-|+|g'|sed -r 's|v(.+)|\1|'
}

prepare() {
  cd ${pkgname}
  autoreconf -fiv
}

build() {
  cd ${pkgname}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
