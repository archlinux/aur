# Maintainer: Marlon Kranz <dev@marlonkranz.com>
pkgname=cast-helper
pkgver=0.2.1
pkgrel=1
pkgdesc="Chromecast and AirPlay mirroring and media playback, shared by the Dux Shell Cast plugin and other apps"
arch=('x86_64' 'aarch64')
url="https://github.com/Conava/cast-helper"
license=('MIT')
depends=('glibc' 'avahi' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad' 'gst-plugin-pipewire' 'gst-plugin-va')
makedepends=('go')
optdepends=('gst-plugins-good: more formats and photos'
            'gst-libav: converting videos'
            'libheif: HEIC photos'
            'doubletake-bin: AirPlay mirroring')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c591a508501492ca10082f47de3b1cbff00caadd67876e96ab3c468f4a0215e8')

build() {
  cd "cast-helper-$pkgver"
  CGO_ENABLED=0 go build -trimpath -buildmode=pie -mod=readonly -modcacherw -ldflags "-s -w" -o cast-helper .
}

package() {
  cd "cast-helper-$pkgver"
  install -Dm755 cast-helper "$pkgdir/usr/bin/cast-helper"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
