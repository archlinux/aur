# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Kevin Whitaker <eyecreate at gmail dot com>

pkgname=tesseract-gui
pkgver=2.9
pkgrel=2
pkgdesc="Tesseract (OCR) GUI"
arch=('any')
url="http://sourceforge.net/projects/tesseract-gui/"
license=('GPL3')
depends=('imagemagick' 'pygtk' 'python2' 'tesseract')
install=$pkgname.install
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-${pkgver%%.*}/$pkgname-$pkgver.tar.gz)
md5sums=('71b9a1c7f493652939158f399f29a85c')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's|#![ ]*/usr/bin/env python[ ]*$|#!/usr/bin/env python2|' bin/tesseract-gui.py
}

package() {
  install -d -m755 "$pkgdir/usr/"{bin,share/icons,share/applications}

  cd $pkgname-$pkgver
  make BASEDIR="$pkgdir/usr/" install

  # Rename
  mv "$pkgdir/usr/bin/"{tesseract-gui.py,$pkgname}
  sed -i 's|Exec=tesseract-gui.py|Exec=tesseract-gui|' "$pkgdir/usr/share/applications/tesseract-gui.desktop"
}

