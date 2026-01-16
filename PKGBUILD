# Maintainer: iiTzDante <https://github.com/iiTzDante>
pkgname=gomusic
pkgver=1.0.19
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
sha256sums=('873c4f03a6b4e25101f8e2fac36cb8d999ea86a29e07431ff651f37e41b932ce')

build() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/gopath"
  go build -trimpath -buildmode=pie -mod=readonly -modcacherw -o "$pkgname" .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  ln -s "$pkgname" "$pkgdir/usr/bin/music"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
