# Maintainer: Evangelos Foutras <foutrelis@archlinux.org>

pkgname=libgnt
pkgver=2.14.4
pkgrel=2
pkgdesc="GLib Ncurses Toolkit"
arch=('x86_64')
url="https://keep.imfreedom.org/libgnt/libgnt"
license=('GPL')
depends=('glib2' 'libxml2' 'ncurses')
makedepends=('meson' 'gtk-doc' 'glib2-devel')
source=(https://downloads.sourceforge.net/project/pidgin/libgnt/$pkgver/$pkgname-$pkgver-dev.tar.xz{,.asc})
sha256sums=('195933a9a731d3575791b881ba5cc0ad2a715e1e9c4c23ccaaa2a17e164c96ec'
            'SKIP')
validpgpkeys=('40DE1DC7288FE3F50AB938C548F66AFFD9BDB729') # Gary Kramlich <grim@reaperworld.com>

prepare() {
  mv -v $pkgname-$pkgver{-dev,}
}

build() {
  arch-meson $pkgname-$pkgver build -D python2=false
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

# vim:set ts=2 sw=2 et:
