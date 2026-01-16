# Maintainer: iiTzDante <https://github.com/iiTzDante>
pkgname=goviz
pkgver=1.0.0
pkgrel=1
pkgdesc="A real-time terminal-based audio visualizer written in Go"
arch=('x86_64' 'aarch64')
url="https://github.com/iiTzDante/goviz"
license=('MIT')
depends=('alsa-lib')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('043534b45fcd2cfe219369b539a91a118f897f1b5b3e967e70004910b48cb4ed')

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
