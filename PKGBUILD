# $Id$
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

_pkgname=cantarell-fonts
pkgver=0.100
pkgname=$_pkgname-$pkgver
pkgrel=1
epoch=1
pkgdesc="Cantarell font family. Version 0.100"
url="https://git.gnome.org/browse/cantarell-fonts"
arch=(any)
license=(custom:SIL)
makedepends=(meson appstream-glib)
source=(https://download.gnome.org/sources/$_pkgname/${pkgver:0:5}/$_pkgname-$pkgver.tar.xz)
sha256sums=('01ad69e855b81af7d6752d374301b8a55576f375a7a46eb58935d7f343cf0689')
provides=( $_pkgname=$pkgver )
conflicts=( $_pkgname )

build() {
  arch-meson $_pkgname-$pkgver build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install

  #mkdir "$pkgdir/etc/fonts/conf.d"
  #ln -srt "$pkgdir/etc/fonts/conf.d" "$pkgdir"/etc/fonts/conf.avail/*

  install -Dm644 $_pkgname-$pkgver/COPYING \
    "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
