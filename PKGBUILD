# Maintainer: xmengnet <my@liyp.cc>
pkgname=revda-next
pkgver=5.8.0
pkgrel=1
pkgdesc='Danmaku live & video player for Linux (pure-Go rewrite of Revda)'
arch=('x86_64')
url='https://github.com/xmengnet/Revda-Next'
license=('GPL-2.0-only')
depends=('mpv' 'ffmpeg')
makedepends=('go')
conflicts=('revda' 'revda-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8332a659945ca9bc1e9c6dbff1a4cbb0b6aa56b45983fc0f61f7856b073438ea')

build() {
  cd "Revda-Next-$pkgver"
  export CGO_ENABLED=0 GOPATH="$srcdir/go" GOMODCACHE="$srcdir/go/mod"
  go build -trimpath -buildmode=pie -ldflags "-s -w" -o revda-next .
}

package() {
  cd "Revda-Next-$pkgver"
  install -Dm755 revda-next "$pkgdir/usr/bin/revda-next"
  install -Dm644 icon/revda-next.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/revda-next.svg"
  install -Dm644 misc/revda-next.desktop "$pkgdir/usr/share/applications/revda-next.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
