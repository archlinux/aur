# Maintainer: iiTzDante <https://github.com/iiTzDante>
pkgname=gotube
pkgver=1.0.5
pkgrel=1
pkgdesc="A beautiful terminal UI for downloading YouTube videos with HD support"
arch=('x86_64' 'aarch64')
url="https://github.com/iiTzDante/gotube"
license=('MIT')
depends=('ffmpeg')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3962ec492f8f71fff520cbcab98176bb5f9a35f204ccfce08969e5b9c6d37c49')

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
