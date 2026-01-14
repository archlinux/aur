pkgname=usque
pkgver=1.4.2
pkgrel=1
pkgdesc="Open-source reimplementation of the Cloudflare WARP client's MASQUE protocol."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/Diniboy1123/$pkgname"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ad36e8097fdee9e3c0219327d0dfccbd7f5c1ae167dcff5469491dc226a2c1e7')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
