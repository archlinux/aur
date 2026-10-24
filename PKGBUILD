# Maintainer: Marlon Kranz <dev@marlonkranz.com>
pkgname=cast-helper
pkgver=0.1.0
pkgrel=2
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
sha256sums=('25226b6f16ed456fed9e19f0fe02a2630140a3a35490b61a1b214447aa909315')

build() {
  cd "dux-cast-$pkgver"
  CGO_ENABLED=0 go build -trimpath -buildmode=pie -mod=readonly -modcacherw -ldflags "-s -w" -o cast-helper .
}

package() {
  cd "dux-cast-$pkgver"
  install -Dm755 cast-helper "$pkgdir/usr/bin/cast-helper"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
