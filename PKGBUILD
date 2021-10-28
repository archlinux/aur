# Maintainer: garionion <garionion at entr0py.de>

pkgname=veilig
pkgver=1.3.5
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
sha256sums=('71a5a89ec6a4c495e9f28588be93ac10036196eaac216748ca97cb1a34c25560')

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
