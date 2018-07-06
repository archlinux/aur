# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=tilemaker-git
pkgver=1.5.0.r11.g6c8c990
pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}
pkgrel=1
pkgdesc="Convert OpenStreetMap .pbf files into vector tiles without the stack"
arch=('i686' 'x86_64')
url="https://github.com/systemed/tilemaker"
license=('custom')
install=$pkgname.install
depends=('boost-libs' 'lua51' 'protobuf' 'sqlite' 'shapelib')
makedepends=('git' 'boost')
source=("$pkgname::git+https://github.com/systemed/${pkgname%-git}")
md5sums=('SKIP')

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  install -Dm 0755 tilemaker $pkgdir/usr/bin/tilemaker
  install -Dm 0644 LICENCE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
