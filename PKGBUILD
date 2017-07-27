# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=karlyriceditor
pkgver=2.2
pkgrel=1
pkgdesc="A program which lets you edit and synchronize lyrics with karaoke songs in various formats."
arch=('i686' 'x86_64')
url="https://www.ulduzsoft.com/linux/karaoke-lyrics-editor/"
license=('GPL')
depends=('qt5-base' 'desktop-file-utils')
source=('openssl-1.1.X.patch' "karlyriceditor-$pkgver.tar.gz::https://sourceforge.net/projects/karlyriceditor/files/$pkgver/karlyriceditor-$pkgver.tar.gz/download?nowrap")
md5sums=('7d510835a99d36362b7ba0cb81e734a8' 'b59ac716a34bfb07e0c21cd61e01ca9e')
install=$pkgname.install

build() {
  patch -p0 < openssl-1.1.X.patch
  cd karlyriceditor-$pkgver
  qmake
  make
}

package() {
  cd karlyriceditor-$pkgver
  install -Dm755 bin/karlyriceditor $pkgdir/usr/bin/karlyriceditor
  install -Dm644 packages/karlyriceditor.desktop $pkgdir/usr/share/applications/karlyriceditor.desktop
  install -Dm644 packages/karlyriceditor.png     $pkgdir/usr/share/pixmaps/karlyriceditor.png
}