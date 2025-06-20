# Maintainer: Sterophonick
pkgname=agbplay-git
_pkgname='agbplay-git'
pkgbase=agbplay
pkgver=c1c9e39
pkgrel=1
pkgdesc='Music player for the most common GBA sound format'
url='https://github.com/ipatix/agbplay'
arch=(x86_64 i686 aarch64)
depends=(boost portaudio ncurses5-compat-libs libsndfile jsoncpp)
makedepends=(base-devel)
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

package() {
  mkdir -p $pkgdir/usr/bin
  cd $srcdir/agbplay
  make -j$(nproc)
  cp ./build/src/agbplay-gui/agbplay-gui $pkgdir/usr/bin
  cp ./build/src/agbplay-nc/agbplay-nc $pkgdir/usr/bin

  cd $srcdir
  install -Dm644 agbplay-gui.desktop $pkgdir/usr/share/applications/agbplay-gui.desktop
  install -Dm644 agbplay-gui.png $pkgdir/usr/share/pixmaps/agbplay-gui.png
}
