# Maintainer: Marlon Kranz <dev@marlonkranz.com>
pkgname=cast-helper
pkgver=0.0.2
pkgrel=1
pkgdesc="Helper for the Cast plugin of Dux Shell: Chromecast and AirPlay mirroring and media playback"
arch=('x86_64' 'aarch64')
url="https://github.com/Conava/dux-plugins"
license=('MIT')
depends=('glibc' 'avahi' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad' 'gst-plugin-pipewire' 'gst-plugin-va')
makedepends=('go')
optdepends=('gst-plugins-good: more formats and photos'
            'gst-libav: converting videos'
            'libheif: HEIC photos'
            'doubletake-bin: AirPlay mirroring')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/cast-v$pkgver.tar.gz")
sha256sums=('01c6ca1dcaa363a70284e12d7cafb624fb9ce094824018197109e007850e7007')

build() {
  cd "dux-plugins-cast-v$pkgver/helpers/cast"
  CGO_ENABLED=0 go build -trimpath -buildmode=pie -mod=readonly -modcacherw -ldflags "-s -w" -o cast-helper .
}

package() {
  cd "dux-plugins-cast-v$pkgver"
  install -Dm755 helpers/cast/cast-helper "$pkgdir/usr/bin/cast-helper"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
