# Contributor: Glen Oakley <goakley123@gmail.com>
# Contributor: Simon Doppler <dopsi@dopsi.ch>
# Maintainer: Swift Geek
pkgname=oregano
pkgver=0.84.22
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
sha512sums=('bac634a08bde8216691da85291d2c62ad00c003c6acc0b9d00136481a9956c42cd48c4145458222167f62885b8fa2a8d32a8ec9fb8b1bfc22a143c148a9dccbc')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./waf configure --prefix=/usr
  ./waf release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  ./waf install --destdir="$pkgdir"
  rm "$pkgdir/usr/share/glib-2.0/schemas/gschemas.compiled"
}
