# Maintainer: Khaled Hosny <khaledhosny@eglug.org>

pkgname=(raqm)
pkgver=0.1.0
pkgrel=1
pkgdesc="Library for complex text layout"
arch=(i686 x86_64)
url="https://github.com/HOST-Oman/libraqm"
license=(MIT)
depends=(freetype2 fribidi harfbuzz)
makedepends=(gtk-doc)
checkdepends=(glib2)
source=(https://github.com/HOST-Oman/libraqm/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('fbccf176ae0ff5aeb73ea3d7a0f2173c432d87a495c10ca2ecdf82323eaa5355')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --enable-gtk-doc
  make
}

check() {
  cd $pkgname-$pkgver
  make -k check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/${pkgname}/COPYING"
}
