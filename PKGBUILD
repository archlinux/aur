# Maintainer: Artem Suprun <efogdev@gmail.com>

pkgname=play-timer-git
provides=('play-timer')
pkgver=2.1.1
pkgrel=1
pkgdesc="CLI-friendly easy-to-use timer app with native DE integration."
arch=('x86_64')
url="https://github.com/efogdev/mpris-timer"
license=('MIT')
depends=('glib2' 'gtk3' 'wayland' 'pulse-native-provider')
makedepends=('go' 'glib2' 'gtk3')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('SKIP')
dirname="mpris-timer"
glibname="io.github.efogdev.mpris-timer"

build() {
  export GOBIN="$srcdir/.bin"
  export GO111MODULE=on
  cd "$srcdir/$dirname-$pkgver"
  go build -pgo default.pgo -tags wayland -trimpath -ldflags="-s -w" -o "$GOBIN/play-timer" ./cmd/main.go
}

package() {
  install -Dm755 "$srcdir/.bin/play-timer" "$pkgdir/usr/bin/play-timer"
  install -Dm644 "$srcdir/$dirname-$pkgver/internal/ui/res/icon.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$glibname.svg"
  install -Dm644 "$srcdir/$dirname-$pkgver/misc/$glibname.desktop" \
    "$pkgdir/usr/share/applications/$glibname.desktop"
  install -Dm644 "$srcdir/$dirname-$pkgver/misc/$glibname.metainfo.xml" \
    "$pkgdir/usr/share/metainfo/$glibname.metainfo.xml"
  install -Dm644 "$srcdir/$dirname-$pkgver/misc/$glibname.gschema.xml" \
    "$pkgdir/usr/share/glib-2.0/schemas/$glibname.gschema.xml"
}

