# Maintainer: nithin <nithin3dev@gmail.com>
pkgname=echo-meter
pkgver=1.1.2
pkgrel=5
pkgdesc="Echo Meter – GTK4 OSD daemon for volume, brightness, mic mute, and keyboard lock status"
arch=('x86_64')
url="https://github.com/Nithin-3/echo-meter"
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell' 'json-glib' 'alsa-lib')
makedepends=('gcc' 'pkgconf' 'make')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c3cf0e3a2e47423f6c652e95c148aeed6808c224c360e4d701ad70d39d507387')
install="$pkgname.install"

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Main daemon
  install -Dm755 echo-meter "$pkgdir/usr/bin/echo-meter"

  # Listener (needs setuid)
  install -Dm755 echolis "$pkgdir/usr/bin/echolis"

  # Helper (needs setuid)
  install -Dm755 write-brightness "$pkgdir/usr/share/echo-meter/write-brightness"

  # Assets
  install -Dm644 assets/conf.json "$pkgdir/usr/share/echo-meter/conf.json"
  install -Dm644 assets/style.css "$pkgdir/usr/share/echo-meter/style.css"

  # License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
