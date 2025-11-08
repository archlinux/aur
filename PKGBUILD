# Maintainer: Vadim Storozhilov <vadim@storozhiloff.ru>
pkgname=yamusic-tui-enhanced
pkgver=0.7.2
pkgrel=1
pkgdesc="Unofficial Yandex Music terminal client with UI toggles and enhanced features. Fork of dece2183/yamusic-tui"
arch=('x86_64' 'i686')
url="https://github.com/bircoder432/yamusic-tui-enhanced"
license=('MIT')
depends=('gtk3' 'libx11' 'alsa-lib')
makedepends=('go')
conflicts=('yamusic-tui' 'yamusic-tui-nomedia' 'yamusic-tui-enhanced-nomedia')
provides=('yamusic-tui-enhanced' 'yamusic-tui')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bircoder432/yamusic-tui-enhanced/archive/v$pkgver.tar.gz")
sha256sums=('83b3c9aa474684a05ab4c8a3396cd8205c5c44f51a79cc9da3987abf1cb600d2')

build() {
  cd "yamusic-tui-enhanced-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -trimpath -ldflags="-w -s -linkmode=external" -o yamusic
}

package() {
  cd "yamusic-tui-enhanced-$pkgver"
  install -Dm755 yamusic "$pkgdir/usr/bin/yamusic"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
