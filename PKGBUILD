# Contributor: Lex Black <autumn-wind@web.de>

pkgname=mpvpaper
pkgver=1.3
pkgrel=3
pkgdesc="video wallpaper program for wlroots based wayland compositors"
arch=('i686' 'x86_64')
url="https://github.com/GhostNaN/$pkgname"
license=('GPL3')
depends=('mpv' 'wlroots')
makedepends=('meson' 'ninja' 'wayland-protocols')
optdepends=('socat: control via sockets')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/GhostNaN/mpvpaper/archive/${pkgver}.tar.gz)
b2sums=('04fe14bcd9a03fab616231f4a594322535eca503b07d3180fc04f4acc0204d659aae80fe455c8992721073bdd8fb04063de5f984337fbad8275258b5986e6558')


build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  install -vDm644 "$pkgname-$pkgver"/mpvpaper.man "$pkgdir"/usr/share/man/man1/${pkgname}.1
}
