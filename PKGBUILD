# Contributor: Glen Oakley <goakley123@gmail.com>
# Maintainer: Swift Geek
pkgname=oregano
pkgver=0.84.21
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
sha512sums=('bf6e7d1174a35dbc53f941dc48c0aed20a13c0fac02df49f74d635f7f91b8917c427d3eac3ff54961b4ee0562e3f22f1256fe3d9ef4d0143a35d2108cdba522d')

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
