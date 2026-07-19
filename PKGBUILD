# Contributor: Lex Black <autumn-wind@web.de>

pkgname=mpvpaper
pkgver=1.9
pkgrel=1
pkgdesc="video wallpaper program for wlroots based wayland compositors"
arch=('i686' 'x86_64')
url="https://github.com/GhostNaN/$pkgname"
license=('GPL3')
depends=('libmpv.so' 'libwayland-client.so' 'libwayland-egl.so')
makedepends=('meson' 'ninja' 'wayland-protocols')
optdepends=('socat: control via sockets')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/GhostNaN/mpvpaper/archive/${pkgver}.tar.gz)
b2sums=('6b3c148d812d068878ba3acdb48b1f6d376980de3bf7bf23204c906011fd0bb8c0ebbb10fd77de1fcb8b4e3c543a6b5a8f1db92e189b128ec44fdfefbfc4b9bf')


build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  install -vDm644 "$pkgname-$pkgver"/mpvpaper.man "$pkgdir"/usr/share/man/man1/${pkgname}.1
}
