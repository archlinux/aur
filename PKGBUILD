# Maintainer: Lex Black <autumn-wind@web.de>
# Contributor: Stoyan Minaev <stoyan.minaev@gmail.com>

pkgname=waybox
pkgver=0.1.0
pkgrel=1
pkgdesc='Openbox clone on Wayland'
url="https://github.com/wizbright/waybox"
arch=('x86_64')
license=('MIT')
depends=('wlroots>=0.15.0' 'wlroots<0.16.0' 'wayland')
makedepends=('meson')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/wizbright/${pkgname}/archive/${pkgver}.tar.gz)
md5sums=('b5e3e2c9a0be34801ccdbfa80338e22f')


build() {
  cd "$pkgname-${pkgver}"
  arch-meson ../build
  ninja -v -C ../build
}

package() {
  cd "$pkgname-${pkgver}"
  DESTDIR="${pkgdir}" meson install -C ../build

  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  install -m 644 LICENSE $pkgdir/usr/share/licenses/$pkgname
}

