# Maintainer: iiTzDante <https://github.com/iiTzDante>
pkgname=gomusic
pkgver=1.0.14
pkgrel=1
pkgdesc="Fast terminal UI for downloading music from YouTube with automatic MP3 conversion"
arch=('x86_64' 'aarch64')
url="https://github.com/iiTzDante/gomusic"
license=('MIT')
depends=('ffmpeg' 'alsa-lib')
optdepends=('chromium: for YouTube scraping'
            'google-chrome: for YouTube scraping')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('988a6df597b024a82775ebc9f2c006c67d965468eb13c1552d21c121e88f0d1d')

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
