# Maintainer: lrx0014 <lrx0014 at hotmail dot com>
pkgname=desktopimage
pkgver=1.0.0
pkgrel=1
pkgdesc="A tool to automatically generate .desktop files for AppImage applications."
arch=('x86_64')
url="https://github.com/lrx0014/DesktopImage"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
source=("git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/DesktopImage"
    git describe --tags --always | sed 's/^v//'
}

build() {
    cd "$srcdir/DesktopImage/src"
    go build -o desktopimage main.go
}

package() {
    install -Dm755 "$srcdir/DesktopImage/src/desktopimage" "$pkgdir/usr/bin/desktopimage"
    install -Dm644 "$srcdir/DesktopImage/desktopimage.service" "$pkgdir/etc/systemd/system/desktopimage.service"
}