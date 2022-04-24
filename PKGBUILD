# Contributor: Glen Oakley <goakley123@gmail.com>
# Contributor: Simon Doppler <dopsi@dopsi.ch>
# Maintainer: Swift Geek
pkgname=oregano
pkgver=0.84.43
pkgrel=1
pkgdesc="Schematic capture and circuit simulator"
arch=('x86_64' 'x86')
depends=('goocanvas2' 'gtksourceview3')
makedepends=('git' 'waf' 'intltool')
provides=('oregano')
install='oregano.install'
url="https://github.com/drahnr/oregano"
license=("GPL2")
source=("$pkgname-$pkgver.tar.gz::https://github.com/drahnr/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('ba91c7ede5649f182c65dd52172065e8964afa3651e593d97f4bbd72115b92f1129a7a422253ff4f633f7da3ea20df80f36d6c54af5574753338f06a68addb6b')

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
