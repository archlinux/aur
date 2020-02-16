# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=obs-cli
pkgver=0.1.0
pkgrel=1
pkgdesc="OBS-cli is a command-line remote control for OBS"
arch=('x86_64' 'i686')
url="https://github.com/muesli/obs-cli"
license=('MIT')
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('fdf82fe31ca743696283c454bb423aeb4e87162626b0838639bbf3dec07210c0')

build() {
    cd "$pkgname-$pkgver"
    go build \
        -trimpath \
        -ldflags "-X main.Version=$pkgver -extldflags $LDFLAGS" \
        -o "obs-cli" .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "obs-cli" "$pkgdir/usr/bin/obs-cli"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=4 sw=4 et:
