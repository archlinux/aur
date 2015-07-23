# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=simple-image-reducer
pkgver=1.0.2
pkgrel=3
pkgdesc="An GTK application to easily reduce and rotate images."
arch=(any)
url="http://simple-image-reducer.org.ua/"
license=('GPL')
depends=('pygtk' 'python2-pillow' 'exifread' 'desktop-file-utils')
makedepends=('intltool')
install="$pkgname.install"
source=("${url}download/${pkgname}-${pkgver}.tar.bz2")
md5sums=('675d5923388270721328cc0674bd7055')

prepare() {
  cd $pkgname-$pkgver

  # python2 shebang
  sed -i "s|env python|&2|" $pkgname.py

  # image to pillow
  sed -i 's/import Image/from PIL &/' $pkgname.py
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
