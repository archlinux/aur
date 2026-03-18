# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=tilemaker
pkgver=3.1.0
pkgrel=1
pkgdesc="Convert OpenStreetMap .pbf files into vector tiles without the stack"
arch=('i686' 'x86_64')
url="https://github.com/systemed/tilemaker"
license=('custom')
install=$pkgname.install
depends=('boost-libs' 'lua>=5.1' 'protobuf' 'sqlite' 'shapelib' 'rapidjson')
makedepends=('boost' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/systemed/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('049faa665c457a3de1dfc020ac1810bb8d4d3ca5357a0e7dbcfa5f2d94f71639f739a159fb2c03584e283b663dd7c6ba8c4d465b9f1ed710eebbec8c772a76a7')

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

package() {
  install -Dm 0755 build/tilemaker $pkgdir/usr/bin/tilemaker
  install -Dm 0644 "$pkgname-$pkgver"/LICENCE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
