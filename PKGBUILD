# Maintainer: John Downey <jdowney@gmail.com>
pkgname=smug
pkgver=0.3.6
pkgrel=1
pkgdesc='A session manager for tmux written in Go'
arch=('x86_64')
url="https://github.com/ivaaaan/smug"
license=('MIT')
makedepends=('go')
source=("https://github.com/ivaaaan/smug/archive/v${pkgver}.tar.gz")
sha256sums=('0664661250ca675f4bc709787817b53759d7b20ecc87e6b01b5f13002d653797')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  go build -o build -buildmode=pie -trimpath -ldflags="-X=main.version=$pkgver -linkmode=external" -mod=readonly -modcacherw
}

check() {
  cd "$pkgname-$pkgver"
  go test
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 man/man1/smug.1 "$pkgdir/usr/share/man/man1/smug.1"
}
