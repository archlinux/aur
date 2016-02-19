# Maintainer: Ivan Puntiy <ivan.puntiy-at-gmail>

pkgname=runescape-launcher
pkgver=2.0.6
pkgrel=1
pkgdesc="RuneScape Game Client"
arch=(x86_64)
url="http://www.runescape.com/"
license=('GPL')
depends=(
  glibc libcurl-compat libvorbis sdl2 webkitgtk2
  libpng12 glew1.10
  desktop-file-utils
)
install=$pkgname.install
source=("http://content.runescape.com/a=13/downloads/ubuntu/pool/non-free/r/$pkgname/${pkgname}_${pkgver}_amd64.deb")
sha256sums=('b59ef54de67abd362b6f32ae3a32a170470c51d2912780b6ae76fb0982dbacf0')

package() {
  cd "$pkgdir"
  bsdtar -xf "$srcdir/data.tar.xz"

  # remove /usr/share/games
  mv usr/share/games/$pkgname usr/share/
  rmdir usr/share/games
  sed -i -e 's:/usr/share/games:/usr/share:g' usr/bin/$pkgname usr/share/applications/$pkgname.desktop

  # libcurl-compat
  sed -i -e 's:\(/usr/share/runescape-launcher/runescape \):LD_PRELOAD=libcurl.so.3 \1:' usr/bin/$pkgname
}
