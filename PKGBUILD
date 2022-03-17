# Maintainer: Lex Black <autumn-wind@web.de>
# Contributor: Stoyan Minaev <stoyan.minaev@gmail.com>

pkgname=waybox
pkgver=0.2.0
pkgrel=3
pkgdesc='Openbox clone on Wayland'
url="https://github.com/wizbright/waybox"
arch=('x86_64')
license=('MIT')
depends=('wlroots>=0.15.0' 'wlroots<0.16.0')
makedepends=('meson' 'wayland-protocols')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/wizbright/${pkgname}/archive/${pkgver}.tar.gz)
md5sums=('065e5d3488223e128536fca6a1198554')


build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
  install -m 644 "$pkgname-${pkgver}"/LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}

