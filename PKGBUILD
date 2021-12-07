# Contributor: Lex Black <autumn-wind@web.de>

pkgname=mpvpaper
pkgver=1.2
pkgrel=1
pkgdesc="video wallpaper program for wlroots based wayland compositors"
arch=('i686' 'x86_64')
url="https://github.com/GhostNaN/$pkgname"
license=('GPL3')
depends=('mpv' 'wlroots')
makedepends=('meson' 'ninja' 'wayland-protocols')
optdepends=('socat: control via sockets')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/GhostNaN/mpvpaper/archive/${pkgver}.tar.gz)
md5sums=('83643f0354e4e753cc72fb94350d4217')


build() {
  cd $pkgname-$pkgver
  meson build --prefix=/usr
  ninja -C build
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" ninja -C build install
  install -vDm644 mpvpaper.man "$pkgdir"/usr/share/man/man1/${pkgname}.1
}
