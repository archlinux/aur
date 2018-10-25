# Contributor: Glen Oakley <goakley123@gmail.com>
# Contributor: Simon Doppler <dopsi@dopsi.ch>
# Maintainer: Swift Geek
pkgname=oregano
pkgver=0.84.40
pkgrel=1
pkgdesc="Schematic capture and circuit simulator"
arch=('x86_64' 'x86')
depends=('goocanvas' 'gtksourceview3')
makedepends=('git' 'waf' 'intltool')
provides=('oregano')
install='oregano.install'
url="https://github.com/drahnr/oregano"
license=("GPL2")
source=("$pkgname-$pkgver.tar.gz::https://github.com/drahnr/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('f4e38ccf09f148cbe609ccfebe3d3476e6b385f4d002cb951ed0d488d84f65557c0fcac986c6e7657684a07d7f7dac4dda663278ed85363de0dcf48f8d02f73e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  waf configure --prefix=/usr build
  waf release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  waf install --destdir="$pkgdir"
  rm "$pkgdir/usr/share/glib-2.0/schemas/gschemas.compiled"
}
