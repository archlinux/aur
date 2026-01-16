# Maintainer: iiTzDante <https://github.com/iiTzDante>
pkgname=gotube
pkgver=1.0.1
pkgrel=1
pkgdesc="A beautiful terminal UI for downloading YouTube videos with HD support"
arch=('x86_64' 'aarch64')
url="https://github.com/iiTzDante/gotube"
license=('MIT')
depends=('ffmpeg')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cb03cbb6e6abf91754f97375d5608a6263897822e0f9127725b3a22f1df383a3')

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
