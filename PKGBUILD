# Maintainer: Avery <aur@avery.cafe>

pkgname=delfin
pkgver=0.4.6
pkgrel=1
pkgdesc="Stream movies and TV shows from Jellyfin"
arch=(x86_64 aarch64)
url=https://delfin.avery.cafe/
license=(GPL-3.0)
depends=(gtk4 libadwaita mpv)
makedepends=(cargo clang meson mold)
provides=(delfin)
source=("https://codeberg.org/avery42/delfin/archive/v$pkgver.tar.gz")
sha256sums=('64cf284457d4097d49e5246423262929c1bb0c54a4d40ff474683eb67c65b003')

build() {
  cd "$pkgname" || exit

  meson setup build -Dprefix=/usr -Dprofile=release
  cd build || exit

  meson compile
}

package() {
  cd "$pkgname"/build || exit

  meson install --destdir "$pkgdir"
}
