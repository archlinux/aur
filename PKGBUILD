# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org>
# Maintainer: tkashkin
# Maintainer: neuromancer
# Contributor: friday
# Contributor: Robert Stoffers <rstoffers@gmail.com>

pkgname=gamehub
_pkgver=0.15.0-1
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Games manager, downloader, library that supports GOG, Steam and Humble Bundle. Designed for Pantheon Shell"
arch=(i686 x86_64 armv6h armv7h aarch64)
url="https://github.com/tkashkin/GameHub"
license=(GPL3)
depends=(gtk3 glib2 libgee libsoup json-glib sqlite webkit2gtk libmanette libxtst)
makedepends=(meson ninja vala)
options=(!strip debug)
source=("GameHub-$pkgver.tar.gz::https://github.com/tkashkin/GameHub/archive/${_pkgver}-master.tar.gz")
sha256sums=('0182a32b595451b6bebf6f8173b6a41690e1c2b2d1c0b1a07cfce2ea0e536302')

build() {
  cd "GameHub-$_pkgver-master"
  CFLAGS="$CFLAGS -O0" meson . build --prefix=/usr -Ddistro=arch --buildtype=debug
  ninja -C build
}

package() {
  cd "GameHub-$_pkgver-master"
  DESTDIR="${pkgdir}" ninja -C build install
}
