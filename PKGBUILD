# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org>
# Maintainer: tkashkin
# Maintainer: neuromancer
# Contributor: friday (github)
# Contributor: Robert Stoffers <rstoffers@gmail.com>

pkgname=gamehub
_pkgver=0.13.1-1-master
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Games manager, downloader, library that supports GOG, Steam and Humble Bundle. Designed for Pantheon Shell"
arch=(i686 x86_64 armv6h armv7h aarch64)
url="https://github.com/tkashkin/GameHub"
license=(GPL3)
depends=(libgranite.so gtk3 glib2 libgee libsoup json-glib sqlite webkit2gtk libmanette libxtst)
makedepends=(meson ninja vala)
options=(!strip debug)
source=("GameHub-$pkgver.tar.gz::https://github.com/tkashkin/GameHub/archive/${_pkgver}.tar.gz")
sha256sums=('387412b6203b1e68bfec27ef7fab46e5dbf7e9cd5cebce6b6698a00e67d9b7e0')

build() {
  cd "GameHub-$_pkgver"
  CFLAGS="$CFLAGS -O0" meson . build --prefix=/usr -Ddistro=arch --buildtype=debug
  ninja -C build
}

package() {
  cd "GameHub-$_pkgver"
  DESTDIR="${pkgdir}" ninja -C build install
  ln -s /usr/bin/com.github.tkashkin.gamehub "$pkgdir/usr/bin/gamehub"
}
