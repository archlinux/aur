# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Kiko <kikocorsentino@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=le-editor
pkgver=1.16.4
pkgrel=1
pkgdesc="A text editor in memorial to Norton Editor with block and binary operations"
arch=('i686' 'x86_64')
url="http://lav.yar.ru//"
license=('GPL3')
depends=('bash' 'ncurses')
source=("http://lav.yar.ru/download/le/le-$pkgver.tar.xz" dickey.patch)
md5sums=('ac8693e5bef6f3d649996b21e161bf1e'
         '4d180d25f95e07c275e6dce101ba2b52')

prepare() {
  cd "$srcdir"/${pkgname%-editor}-${pkgver}
  patch -Np1 < $srcdir/dickey.patch
}

build() {
  cd "${srcdir}/${pkgname%-editor}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname%-editor}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
