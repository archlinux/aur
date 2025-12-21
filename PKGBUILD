pkgname=hostman
pkgver=1.2.2
pkgrel=1
pkgdesc="A simple file host manager for various image hosting services"
arch=('x86_64')
url="https://github.com/Bestire/hostman"
license=('MIT')
depends=('curl' 'sqlite' 'openssl' 'cjson')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('16f4339c28e12a96d9149ee737d7a19bf233c712c1cc51b8e2b4f5be955ffc57')

build() {
  cd "$pkgname-$pkgver"
  cmake -B build -DHOSTMAN_USE_TUI=ON -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 build/hostman "$pkgdir/usr/bin/hostman"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
