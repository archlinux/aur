# Maintainer: ebiadsu <ebiadsu at posteo de>
# Contributor: David Scholl <djscholl at gmail dot com>
pkgname=xmlcopyeditor
pkgver=1.3.0.0
pkgrel=1
pkgdesc="XML editor based on Scintilla."
arch=('i686' 'x86_64')
url="http://xml-copy-editor.sourceforge.net"
license=('custom')
depends=('enchant' 'aspell' 'expat' 'libxml2' 'libxslt' 'pcre' 'wxgtk3' 'xerces-c')
makedepends=('boost' 'intltool')
install="xmlcopyeditor.install"
source=(https://sourceforge.net/projects/xml-copy-editor/files/$pkgname-linux/$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('5feebc56124601c1a8b7a3079b8f766c6282c256e39a2e34cdf64156ba910195a1b64fecea41d0a4022f00dcd3cd4f46f433fff3766acb6239ca70d7675b14c0')


build() {
  cd $srcdir/$pkgname
  ./configure --with-gtk=3.0 --with-wx-config=wx-config-gtk3 --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname
  make DESTDIR=$pkgdir install
  install -d $pkgdir/usr/share/$pkgname
  install -d $pkgdir/usr/share/licenses/$pkgname
  cp -R $srcdir/$pkgname/src/copying/* $pkgdir/usr/share/licenses/$pkgname
}

