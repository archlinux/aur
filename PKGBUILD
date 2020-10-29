# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=spivak-git
pkgver=r174.2507040
pkgrel=1
pkgdesc="Karaoke player based on GStreamer and Qt5 (git)"
arch=(x86_64)
url="https://github.com/gyunaev/spivak"
license=(GPL3)
depends=(gst-plugins-base libzip qt5-base uchardet)
makedepends=(git)
source=("${pkgname}"::"git+https://github.com/gyunaev/spivak.git")
conflicts=('spivak')
provides=('spivak')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $pkgname
  sed -i '/SUBDIRS += languagedetector/d' plugins/plugins.pro
}

build() {
  cd $pkgname
  qmake
  make
}

package() {
  cd $pkgname
  install -Dm755 src/spivak "$pkgdir/usr/bin/spivak"
  install -Dm644 packaging/spivak.desktop "$pkgdir/usr/share/applications/spivak.desktop"
  install -Dm644 packaging/icon.png "$pkgdir/usr/share/pixmaps/spivak.png"
}
