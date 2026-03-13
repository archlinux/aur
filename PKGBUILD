pkgname=sshw
pkgver=1.5.2.r2
pkgrel=1
pkgdesc="SSH client wrapper for automatic login"
arch=('x86_64')
url="https://github.com/lixvbnet/sshw"
license=('MIT')
depends=('glibc')
makedepends=('go')
_commit=47efde86bf40094c79413cbe58efd3506460e823

source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$_commit"
  mkdir -p build
  go build -trimpath -ldflags="-s -w" -o build/sshw .
}

package() {
  cd "$srcdir/$pkgname-$_commit"

  install -Dm755 build/sshw "$pkgdir/usr/bin/sshw"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
