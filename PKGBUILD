# Maintainer: Nick Østergaard <oe.nick at gmail dot com>
pkgname=lxi-tools-git
pkgver=r724.91ee029
pkgrel=1
pkgdesc="LXI Tools is a collection of software tools for controlling LXI instruments"
arch=('i686' 'x86_64')
url="https://github.com/lxi/lxi-tools"
license=('BSD-3')
provides=('lxi-tools')
conflicts=('lxi-tools')
depends=('liblxi-git' 'lua53' 'gtk4>=4.5.0' 'gtksourceview5>=5.3.3')
makedepends=('git' 'meson')
source=("$pkgname::git+https://github.com/lxi/lxi-tools")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  meson --prefix=/usr --buildtype=plain -Dgui=true --wrap-mode=nofallback . build
  meson compile -C build
}

package() {
  cd "$srcdir/$pkgname"
  meson install -C build --destdir "$pkgdir"
}

# vim:set ts=2 sw=2 et:

