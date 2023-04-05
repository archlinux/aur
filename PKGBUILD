# Maintainer: Kenichi Takahashi <kenichi.taka@gmail.com>

pkgname=kagiana
pkgver=0.4.4
pkgrel=1
pkgdesc='It is OAuth Authenticator & Vault Certificate Getter'
arch=('x86_64')
url="https://github.com/pyama86/$pkgname"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver::$url/archive/refs/tags/v$pkgver.tar.gz")

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  go build -a  -ldflags="-s -w -extldflags \"-static\"" -o=build/kagiana main.go
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums=('8e9b7d61cc7a8187002003117d77cda8cc19e5336399e55e850e90af21287be5')
