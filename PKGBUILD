# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=xwallpaper
pkgver=0.2.0
pkgrel=2
pkgdesc='Wallpaper setting utility for X'
url='https://github.com/stoeckmann/xwallpaper'
arch=('i686' 'x86_64')
license=('ISC')
depends=('pixman' 'libpng' 'libxpm' 'xcb-util' 'xcb-util-image' 'libjpeg-turbo')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/stoeckmann/xwallpaper/archive/v${pkgver}.tar.gz)
sha256sums=('436bc3554b504d897d1c7599118164a4e30cc26d88846bb6e71de3f4f7ce1fdf')
sha512sums=('3556106f9696a5aa60c28d541fc89778194e5cd5edc6f3c299f7ec95c824b7b81baa95f6ceff88688179d2627d64718ffa99291192c9d2b212ae05a694754b11')

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
