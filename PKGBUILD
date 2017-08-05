# Maintainer: con-f-use <con-f-use@gmx.net>
pkgname=comix
pkgver=4.0.4
pkgrel=1
epoch=
pkgdesc="A user-friendly, customizable comic/image viewer"
arch=('x86_64')
url="https://sourceforge.net/projects/comix"
license=('GPLv2')
depends=('unrar' 'python2-pillow' 'pygtk')
makedepends=('tar' 'pygtk' 'python2-pillow')
options=('emptydirs')
source=("https://downloads.sourceforge.net/project/comix/comix/comix-4.0.4/comix-4.0.4.tar.gz?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fcomix%2Ffiles%2F")
md5sums=('029227a77b122f7080ee0280d41bee78')

prepare() {
  cd "$srcdir/$pkgname-$pkgver/src"
  sed -i 's/import Image/from PIL import Image/g' thumbbar.py histogram.py image.py library.py thumbnail.py thumbremover.py comix.py ../mime/comicthumb ../install.py
  sed -i 's~#!/usr/bin/env python~#!/usr/bin/env python2~g' comix.py ../mime/comicthumb ../install.py
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/local/"
  python2 install.py install --dir "$pkgdir/usr/local/"
}
