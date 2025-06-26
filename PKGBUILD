# Maintainer: Sterophonick
pkgname=agbplay-git
_pkgname='agbplay-git'
pkgbase=agbplay
pkgver=c1c9e39
pkgrel=5
pkgdesc='Music player for the most common GBA sound format'
url='https://github.com/ipatix/agbplay'
arch=(x86_64 i686 aarch64)
depends=(fmt libzip zlib boost portaudio ncurses qt6-base nlohmann-json)
makedepends=(cmake base-devel)
source=(git+https://github.com/ipatix/agbplay
        agbplay-gui.desktop
        agbplay-gui.png)
md5sums=('SKIP'
         'SKIP'
         'SKIP')
license=('gplv3')

pkgver() {
  cd "$srcdir/agbplay"
  git describe --tags --long --always | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/agbplay
  make -j$(nproc)
}

package() {
  install -Dm755 $srcdir/agbplay/build/src/agbplay-gui/agbplay-gui $pkgdir/usr/bin/agbplay-gui
  install -Dm755 $srcdir/agbplay/build/src/agbplay-nc/agbplay-nc $pkgdir/usr/bin/agbplay-nc

  install -Dm644 $srcdir/agbplay/build/src/agbplay/libagbplay.so $pkgdir/usr/lib/libagbplay.so

  install -Dm644 $srcdir/agbplay-gui.desktop $pkgdir/usr/share/applications/agbplay-gui.desktop
  install -Dm644 $srcdir/agbplay-gui.png $pkgdir/usr/share/pixmaps/agbplay-gui.png
}
