# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=spivak-git
pkgver=r212.7afcea2
pkgrel=2
pkgdesc="Karaoke player based on GStreamer and Qt6 (git)"
arch=(x86_64)
url="https://github.com/gyunaev/spivak"
license=(GPL3)
depends=(gst-plugins-base libzip qt6-base uchardet cld2-git)
makedepends=(git)
source=("${pkgname}"::"git+https://github.com/gyunaev/spivak.git")
conflicts=('spivak')
provides=('spivak')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname
  qmake6
  make
}

package() {
  cd $pkgname
  install -Dm755 src/spivak "$pkgdir/usr/bin/spivak"
  install -Dm644 packaging/spivak.desktop "$pkgdir/usr/share/applications/spivak.desktop"
  install -Dm644 packaging/spivak.png "$pkgdir/usr/share/pixmaps/spivak.png"
}
