# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=obs-scene-switcher
pkgver=0.1.0
pkgrel=1
pkgdesc="Tracks your active window and switches OBS scenes accordingly"
arch=('x86_64' 'i686')
url="https://github.com/muesli/obs-scene-switcher"
license=('MIT')
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('ac4379fe8a19ce6bf313503f0d046a06becbb361429d6eea4eca586a935dbc04')

build() {
    cd "$pkgname-$pkgver"
    go build \
        -trimpath \
        -ldflags "-X main.Version=$pkgver -extldflags $LDFLAGS" \
        -o "obs-scene-switcher" .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "obs-scene-switcher" "$pkgdir/usr/bin/obs-scene-switcher"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=4 sw=4 et:
