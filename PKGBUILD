# Maintainer: Evangelos Foutras <foutrelis@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Dale Blount <dale@archlinux.org>

pkgname=pidgin-plugin-pack
_pkgname=purple-plugin-pack
pkgver=2.8.0
pkgrel=3
pkgdesc="Plugins for libpurple and derived IM clients"
arch=('x86_64')
url="https://keep.imfreedom.org/pidgin/purple-plugin-pack"
license=('GPL')
depends=('pidgin' 'purple-plugin-pack')
makedepends=('meson')
source=(https://downloads.sourceforge.net/pidgin/purple%20plugin%20pack/$pkgver/$_pkgname-$pkgver.tar.xz{,.asc})
sha256sums=('82ccde9a7251a75b7e03a3f9a929014d8e008c1b6f46e58638f5f476da3e242d'
            'SKIP')
validpgpkeys=('40DE1DC7288FE3F50AB938C548F66AFFD9BDB729') # Gary Kramlich <grim@reaperworld.com>

prepare() {
  cd $_pkgname-$pkgver
  mkdir build
}

build() {
  CFLAGS+=' -Wno-incompatible-pointer-types'
  arch-meson $_pkgname-$pkgver build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build

  # Remove files that are already in purple-plugin-pack
  rm -r "$pkgdir/usr/lib/purple-2/"
  rm -r "$pkgdir/usr/share/"
}

# vim:set ts=2 sw=2 et:
