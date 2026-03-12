# Maintainer: Daniël Nazarkin <aur.danicatgames@pm.me>
pkgname=wifitui
pkgver=0.11.0
pkgrel=1
pkgdesc="Fast featureful friendly wifi terminal UI"
arch=("aarch64" "x86_64")
url="https://github.com/shazow/wifitui"
license=("MIT")
depends=("glibc")
makedepends=("go")
source=("$pkgname-$pkgver::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f3fb64564fd5cd896a16aa36b8214733c88344e6154a63d37357dd9ecbeebece')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o $pkgname .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
