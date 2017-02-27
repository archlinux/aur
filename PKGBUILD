# Maintainer: kikadf <kikadf.01@gmail.com>

pkgname=clipgrab-qt5
pkgver=3.6.3
pkgrel=1
pkgdesc='Fork of ClipGrab to make it compatible with Qt5'
arch=('i686' 'x86_64')
url='https://github.com/OpenHelios/clipgrab-qt5'
license=(GPL3)
depends=('qt5-webkit')
optdepends=('ffmpeg: for the conversion functionality')
makedepends=('git')
source=($pkgname::git+https://github.com/OpenHelios/clipgrab-qt5.git
        $pkgname.desktop)
md5sums=('SKIP'
         '86ec4e7907a20dcae2c0cf6ad2438632')

pkgver() {
  cd $pkgname
  printf "$pkgver.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname

  qmake clipgrab.pro
  make
}

package() {
  cd $pkgname
  install -Dm755 clipgrab "$pkgdir/usr/bin/$pkgname"
  install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
