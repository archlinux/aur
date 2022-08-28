# Maintainer: Nick Østergaard <oe.nick at gmail dot com>
pkgname=liblxi-git
pkgver=r169.3edd961
pkgrel=1
pkgdesc="LXI library"
arch=('i686' 'x86_64')
url="https://github.com/lxi/liblxi"
license=('BSD-3')
provides=('liblxi')
conflicts=('liblxi')
depends=('libxml2' 'avahi' 'libadwaita')
makedepends=('git' 'meson')
optdepends=('lxi-tools')
source=("$pkgname::git+https://github.com/lxi/liblxi")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  meson --prefix=/usr --buildtype=plain --wrap-mode=nofallback . build
  meson compile -C build
}

package() {
  cd "$srcdir/$pkgname"
  meson install -C build --destdir "$pkgdir"
}

# vim:set ts=2 sw=2 et:

