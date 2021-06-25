# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Kevin Whitaker <eyecreate at gmail dot com>

pkgname=tesseract-gui
pkgver=2.9
pkgrel=3
pkgdesc="Tesseract (OCR) GUI"
arch=('any')
url="https://sourceforge.net/projects/tesseract-gui/"
license=('GPL3')
depends=('imagemagick' 'pygtk' 'tesseract')
install=$pkgname.install
source=(https://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-${pkgver%%.*}/$pkgname-$pkgver.tar.gz)
sha256sums=('867c89e3750f820fa661ce0f8aa7a53e4f0a1d5545679e74f3bbf10bd7544ef6')

prepare() {
  sed -i 's|#![ ]*/usr/bin/env python[ ]*$|#!/usr/bin/env python2|' $pkgname-$pkgver/bin/tesseract-gui.py
}

package() {
  install -d -m755 "$pkgdir/usr/"{bin,share/icons,share/applications}

  make -C $pkgname-$pkgver BASEDIR="$pkgdir/usr/" install

  # Rename
  mv "$pkgdir/usr/bin/"{tesseract-gui.py,$pkgname}
  sed -i 's|Exec=tesseract-gui.py|Exec=tesseract-gui|' "$pkgdir/usr/share/applications/tesseract-gui.desktop"
}

