# Maintainer: garionion <garionion at entr0py.de>

pkgname=veilig
pkgver=1.3.2
pkgrel=1
pkgdesc='Toy TLS certificate viewer'
arch=('x86_64') #maybe any, but i can only test on x86_64
url="https://github.com/noqqe/veilig"
license=('MIT')
provides=("$pkgname")
conflicts=("$pkgname")
depends=('glibc')
makedepends=('go')
source=("veilig-v${pkgver}.tar.gz::https://github.com/noqqe/veilig/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('aa7fb76374d23ae755656b85a7e8e21c59a2b19f187f56e352ae6d4d5a39dd6e')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o veilig-bin .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 veilig-bin "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
