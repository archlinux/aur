# Maintainer: iiTzDante <https://github.com/iiTzDante>
pkgname=gotube
pkgver=1.0.4
pkgrel=1
pkgdesc="A beautiful terminal UI for downloading YouTube videos with HD support"
arch=('x86_64' 'aarch64')
url="https://github.com/iiTzDante/gotube"
license=('MIT')
depends=('ffmpeg')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d6339ae6f895e2c6c64cac1e426fc65c0d02fe11f463e3f42344a26d421663bf')

build() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/gopath"
  go build -trimpath -buildmode=pie -mod=readonly -modcacherw -o "$pkgname" main.go
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
