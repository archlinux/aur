# Maintainer: n1t0r <aur@n1t0r.com>
# Contributor: ebiadsu <ebiadsu at posteo de>
# Contributor: David Scholl <djscholl at gmail dot com>
pkgname=xmlcopyeditor
pkgver=1.3.1.0
pkgrel=1
pkgdesc="XML editor based on Scintilla."
arch=('i686' 'x86_64')
url="http://xml-copy-editor.sourceforge.net"
license=('custom')
depends=('enchant' 'aspell' 'expat' 'libxml2' 'libxslt' 'pcre' 'wxwidgets-gtk3' 'xerces-c')
makedepends=('boost' 'intltool')
install="xmlcopyeditor.install"
source=(https://sourceforge.net/projects/xml-copy-editor/files/$pkgname-linux/$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('ea262e1ac6536b71e3328e695ae5825a9aff7db7a8024eedc1b3f568a75deda06f0aaff838438f91ba44de5280d6288dc8dc2d85f74f1eb638ecc01e60481be7')


build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --with-gtk=3.0 --with-wx-config=wx-config --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
  install -d $pkgdir/usr/share/$pkgname
  install -d $pkgdir/usr/share/licenses/$pkgname
  cp -R $srcdir/$pkgname-$pkgver/src/copying/* $pkgdir/usr/share/licenses/$pkgname
}

