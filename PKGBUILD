# Contributor: Glen Oakley <goakley123@gmail.com>
# Maintainer: Swift Geek
pkgname=oregano
pkgver=0.84.13
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
sha512sums=('4f3050f4035e1b4862835ed3c84f4b14b7505e7e627872117cfb8d2e4ed1ceb8d503f107c893be998caf9368da879ed51789d54b185244f3a41ff9ac20521ca1')

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
