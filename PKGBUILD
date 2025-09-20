pkgname=swordfish-git
pkgver=1.2.1
pkgrel=1
pkgdesc="A pkill-like CLI tool with more control over process management."
arch=('x86_64')
url="https://github.com/Foox-dev/swordfish"
license=('MIT')
depends=()
makedepends=('git' 'gcc' 'make')
provides=('swordfish')
conflicts=('swordfish')
source=("git+$url")
upstream_url="https://github.com/Foox-dev/swordfish"
md5sums=('SKIP')
pkgver() {
  cd "$srcdir/swordfish"
  # Automatically generate a version like r1234.abcd123
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}
build() {
  cd "$srcdir/swordfish"
  make
}
package() {
  cd "$srcdir/swordfish"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
