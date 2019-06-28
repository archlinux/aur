# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org>
# Maintainer: tkashkin
# Maintainer: neuromancer
# Contributor: friday
# Contributor: Robert Stoffers <rstoffers@gmail.com>

pkgname=gamehub
_pkgver=0.14.1-2-master
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Games manager, downloader, library that supports GOG, Steam and Humble Bundle. Designed for Pantheon Shell"
arch=(i686 x86_64 armv6h armv7h aarch64)
url="https://github.com/tkashkin/GameHub"
license=(GPL3)
depends=(gtk3 glib2 libgee libsoup json-glib sqlite webkit2gtk libmanette libxtst)
makedepends=(meson ninja vala)
options=(!strip debug)
source=("GameHub-$pkgver.tar.gz::https://github.com/tkashkin/GameHub/archive/${_pkgver}.tar.gz")
sha256sums=('3f4c77dc3d65adab293ee0ac209f111e077e5d0a6c0800d031f11cc3056325b7')

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
