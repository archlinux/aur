# Maintainer: Lex Black <autumn-wind@web.de>
# Contributor: Stoyan Minaev <stoyan.minaev@gmail.com>

pkgname=waybox
pkgver=0.0.2.1
pkgrel=1
pkgdesc='Openbox clone on Wayland'
url="https://github.com/wizbright/waybox"
arch=('x86_64')
license=('MIT')
depends=('wlroots' 'wayland')
makedepends=('meson')
# use tags from Keith Bowes personal dev repo
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/keithbowes/${pkgname}/archive/${pkgver}.tar.gz)
md5sums=('dfd258fbfb69518f04c6042d2c816ec2')


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

