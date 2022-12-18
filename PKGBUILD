# Maintainer: Abdulkadir Furkan Şanlı <me@abdulocra.cy>

pkgname=speedtest-go
pkgver=1.3.1
pkgrel=1
pkgdesc='CLI and Go API to Test Internet Speed using speedtest.net'
arch=('x86_64')
url="https://github.com/showwin/$pkgname"
license=('MIT')
makedepends=('go')
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://github.com/showwin/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8ab904f4e631a0b4c56731ce5cf2e915bbf83626b7a93454b5a9fcbc3fb7cd21')

prepare() {
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
  go build
}

check() {
  cd "$pkgname-$pkgver"
  go test "./${pkgname%-go}"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
