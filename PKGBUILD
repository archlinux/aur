# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>

pkgname=lumina
pkgver=0.4.0
pkgrel=3
pkgdesc="Free cross-platform development environment for GLSL shaders"
arch=('i686' 'x86_64')
url="http://lumina.sourceforge.net"
license=('GPL')
depends=('qt')
makedepends=('glew')
optdepends=('blender: for mesh export script')
install=lumina.install
source=(http://downloads.sourceforge.net/$pkgname/Lumina-$pkgver.tar.bz2 lumina.desktop search_paths.patch source_edit.patch)
md5sums=('f6d17cb7ee39fbcc88623ba3ab252524' '3e99ede58a3fd82c209fc72b887ebc39'
         '4a6126d743a05184a8a45874d186f6d3' 'dc46667f3d19a119d2daa89b45e262ba')

build() {
  cd $srcdir/Lumina-$pkgver
  patch -p1 < ../search_paths.patch
  patch -p1 < ../source_edit.patch

  qmake
  make || return 1

  install -D -m755 lumina $pkgdir/usr/bin/lumina
  install -D -m644 Blenderexporter/luminaexporter.py  $pkgdir/usr/share/blender/scripts/luminaexporter.py
  install -d $pkgdir/usr/share/lumina
  cp -R examples media plugins $pkgdir/usr/share/lumina

  install -d $pkgdir/usr/share/applications
  install -m644 $srcdir/lumina.desktop $pkgdir/usr/share/applications
  install -d $pkgdir/usr/share/pixmaps
  install -m644 images/lumina.png $pkgdir/usr/share/pixmaps
}
