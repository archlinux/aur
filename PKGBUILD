# Maintainer: iiTzDante <https://github.com/iiTzDante>
pkgname=gomusic
pkgver=1.0.25
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
sha256sums=('cccdf8541ca6835b451afddd6bd904d5d36922c243e30d91b88f0f07fe38b8a9')

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
