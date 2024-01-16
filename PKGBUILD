# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=tilemaker
pkgver=3.0.0
pkgrel=1
pkgdesc="Convert OpenStreetMap .pbf files into vector tiles without the stack"
arch=('i686' 'x86_64')
url="https://github.com/systemed/tilemaker"
license=('custom')
install=$pkgname.install
depends=('boost-libs' 'lua>=5.1' 'protobuf' 'sqlite' 'shapelib' 'rapidjson')
makedepends=('boost' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/systemed/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('33c568d0107bf0cd9510f860d221fb4980bcf9ba07de2063c8842f0436aad612f1c17464d4bbe00547605d0066a00ec8ec00e1832169c05f48135f7f51898bed')

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
