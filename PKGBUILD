# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Maintainer: tkashkin
# Maintainer: neuromancer
# Contributor: friday
# Contributor: Robert Stoffers <rstoffers@gmail.com>

pkgname=gamehub
_pkgver=0.16.3-2
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Games manager, downloader, library that supports GOG, Steam and Humble Bundle"
arch=(i686 x86_64 armv6h armv7h aarch64)
url="https://tkashkin.github.io/projects/gamehub/"
license=(GPL3)
depends=(gtk3 glib2 libgee libsoup json-glib sqlite webkit2gtk libmanette libxtst)
makedepends=(git meson ninja vala)
options=(!strip debug)
#source=("git+https://github.com/tkashkin/GameHub/archive/${_pkgver}-master.tar.gz")
source=("git+https://github.com/tkashkin/GameHub.git#tag=${_pkgver}-master"
        "https://raw.githubusercontent.com/FabioLolix/AUR-artifacts/master/gamehub-protonfix.patch")
sha256sums=('SKIP'
            '26e267dade0b416699707a8612aa4f1c32b60a08889c217127ddf1843b7302ba')

prepare() {
  cd "GameHub"
  patch -Np1 -i ../gamehub-protonfix.patch
}

build() {
  cd "GameHub"
  CFLAGS="$CFLAGS -O0" meson . build --prefix=/usr -Ddistro=arch --buildtype=debug
  ninja -C build
}

package() {
  cd "GameHub"
  DESTDIR="${pkgdir}" ninja -C build install
}
