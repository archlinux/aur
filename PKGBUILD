# Maintainer: Marlon Kranz <dev@marlonkranz.com>
pkgname=cast-helper
pkgver=0.2.0
pkgrel=1
pkgdesc="Chromecast and AirPlay mirroring and media playback, shared by the Dux Shell Cast plugin and other apps"
arch=('x86_64' 'aarch64')
url="https://github.com/Conava/dux-cast"
license=('MIT')
depends=('glibc' 'avahi' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad' 'gst-plugin-pipewire' 'gst-plugin-va')
makedepends=('go')
optdepends=('gst-plugins-good: more formats and photos'
            'gst-libav: converting videos'
            'libheif: HEIC photos'
            'doubletake-bin: AirPlay mirroring')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7ea01a88da0464100cd2c895c781db97da6d8064844f882299053e8d9eeac416')

build() {
  cd "dux-cast-$pkgver"
  CGO_ENABLED=0 go build -trimpath -buildmode=pie -mod=readonly -modcacherw -ldflags "-s -w" -o cast-helper .
}

package() {
  cd "dux-cast-$pkgver"
  install -Dm755 cast-helper "$pkgdir/usr/bin/cast-helper"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
