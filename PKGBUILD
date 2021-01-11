# Maintainer: Jeremy MountainJohnson <jay@jskier.com>
pkgname=gophercap
pkgver=0.1.1
pkgrel=2
pkgdesc='Accurate, modular, scalable PCAP manipulation tool written in Go.'
arch=('x86_64')
url="https://github.com/StamusNetworks/gophercap"
license=('Apache')
makedepends=('go')
source=("https://github.com/StamusNetworks/gophercap/archive/v$pkgver.tar.gz")
sha256sums=('bd9afc756d8dac687217d077231175267d0733c18940a85b6ddb32b691c849df')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go get -u ./
  go build -ldflags="-X 'gopherCap/cmd.Version=$pkgver'" -o ./$pkgname ./
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

}
