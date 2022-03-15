# Contributor: Lex Black <autumn-wind@web.de>

pkgname=mpvpaper
pkgver=1.2.1
pkgrel=1
pkgdesc="video wallpaper program for wlroots based wayland compositors"
arch=('i686' 'x86_64')
url="https://github.com/GhostNaN/$pkgname"
license=('GPL3')
depends=('mpv' 'wlroots')
makedepends=('meson' 'ninja' 'wayland-protocols')
optdepends=('socat: control via sockets')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/GhostNaN/mpvpaper/archive/${pkgver}.tar.gz)
b2sums=('6384e7b1b816a051b657d68cbc47792a20a6d016a6c4feefdf5bf8ddd87a9658959d426f3dcf4f7c7b396d62b5dccc1df47a8fa07a61a83c1eb0a534b84325cb')


build() {
  meson --prefix=/usr "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  install -vDm644 "$pkgname-$pkgver"/mpvpaper.man "$pkgdir"/usr/share/man/man1/${pkgname}.1
}
